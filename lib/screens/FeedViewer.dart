

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:toast/toast.dart';
class SavedFeed {
  String title;
  String subtitle;
  String desc;
  String dp;
  String image;
  String url;
  String time;
  SavedFeed(DocumentSnapshot d){
    this.title = d['title'];
    this.subtitle = d['subtitle'];
    this.desc = d['desc'];
    this.dp = d['dp'];
    this.image = d['image'];
    this.url = d['url'];
    this.time = d['time'].toString();
  }
  SavedFeed.fromJson(Map<String,dynamic> json)
      : title = json['title'],
        subtitle = json['subtitle'],
        desc = json['desc'],
        dp = json['dp'],
        image = json['image'],
        url = json['url'],
        time = json['time'];
  Map<String,dynamic> toJson() => {
     'title': title,
      'subtitle': subtitle,
      'desc': desc,
      'dp': dp,
       'image': image,
       'url': url,
       'time': time,
  };
}
List<SavedFeed> a = [];
class FeedViewer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _FeedViewer();
  }

}
double left,right;
int ctr=0;
final icon = [Icons.star_border,Icons.star];
final col = [Colors.grey,Colors.amber];
final colors = [Colors.white,Colors.white70];
int initpage=0;
int index = 0;
class SharedPref{
  read(String key)async{
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key));
  }
  save(String key, value)async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }
  remove(String key)async{
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

}
class _FeedViewer extends State<FeedViewer> with TickerProviderStateMixin{
  AnimationController animationController;
  Animation animation;
  SharedPref sharedPreferences = SharedPref();
  final controller = PageController(
    initialPage: initpage,
  );
  @override
  void initState() {
    super.initState();

    animationController = (AnimationController(duration: Duration(milliseconds: 150),vsync: this));
    animationController.addStatusListener((status) {
      if(status==AnimationStatus.completed){

        if(right==null)
          {
            setState(() {
              right = MediaQuery.of(context).size.width/4-5;
              left = null;
            });
          }
        else
          {
            left = MediaQuery.of(context).size.width/4-5;
            right = null;
          }
        animationController.reverse();
      }
    });
  }
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
  Future<void> _refresh() async{
    setState(() {
    });
    Toast.show("Refreshed Feed", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM,backgroundColor: Colors.black45);
  }
  @override
  Widget build(BuildContext context) {
    if(ctr==0)
      {
        left = MediaQuery.of(context).size.width/4-5;
        right = null;
        ctr++;
      }
    animation = Tween(begin: 10.0,end: MediaQuery.of(context).size.width/2+10).animate(CurvedAnimation(parent: animationController,curve: Curves.linear));
      return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context,Widget child){
          return Scaffold(
            body: Stack(
                children: <Widget>[

                  PageView(
                    controller: controller,
                    onPageChanged: (ind){
                      setState(() {
                        animationController.forward();
                        index = ind;
                        loadSharedPref();
                      });
                    },
                    children: <Widget>[
                      Padding(
                        child: StreamBuilder<QuerySnapshot>(
                          stream: Firestore.instance.collection('feed').snapshots(),
                          builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                            if(snapshot.hasError)
                              return Text("Sorry! There was some problem loading the text. Please try again Later");
                            else if(snapshot.connectionState==ConnectionState.waiting)
                              return SizedBox(
                                height: MediaQuery.of(context).size.height/2,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            else
                              return RefreshIndicator(
                                child: ListView(
                                  children: snapshot.data.documents.map((DocumentSnapshot document){

                                    return Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Material(
                                        elevation: 10,
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        child: Column(
                                          children: <Widget>[
                                            SizedBox(
                                              height: 10,
                                            ),
                                            ListTile(
                                              leading: Container(
                                                // height: 50,
                                                // width: 40,
                                                child: Image.network(document['dp'],fit: BoxFit.fill,
                                                  loadingBuilder: (BuildContext context,Widget child,ImageChunkEvent loadProgress){
                                                    if(loadProgress!=null)
                                                      return CircularProgressIndicator();
                                                    else
                                                      return child;
                                                  },
                                                ),
                                              ),
                                              title: Text(document['title'],style: TextStyle(fontSize: 18),),
                                              subtitle: (document['subtitle']==null)?Container():Text(document['subtitle'],style: TextStyle(fontSize: 15),),
                                              trailing: IconButton(
                                                icon: Icon(Icons.star_border),
                                                onPressed: (){
                                                  SavedFeed saved = new SavedFeed(document);
                                                  sharedPreferences.save(document['time'].toString(), saved);
                                                  print('save');
                                                  Toast.show("Saved", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM,backgroundColor: Colors.black45);
                                                  loadSharedPref();
                                                },
                                              ),
                                            ),
                                            Container(
                                              //  height: MediaQuery.of(context).size.width-40,
                                              // width:  MediaQuery.of(context).size.width-40,
                                              child: Image.network(document['image'],fit: BoxFit.fill,
                                                loadingBuilder: (BuildContext context,Widget child,ImageChunkEvent loadProgress){
                                                  if(loadProgress!=null)
                                                    return Container(
                                                      width: MediaQuery.of(context).size.width-40,
                                                      height: 300,
                                                      child: Center(
                                                        child: CircularProgressIndicator(),
                                                      ),
                                                    );
                                                  else
                                                    return child;
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Container(
                                                width:  MediaQuery.of(context).size.width-40,
                                                child: Text(document['desc'],style: TextStyle(fontSize: 15),),
                                              ),
                                            ),
                                            (document['url']==null)?Container():GestureDetector(
                                                child: Container(
                                                  width: MediaQuery.of(context).size.width-40,
                                                  child: ListTile(
                                                    leading: Icon(Icons.link,color: Colors.black,),
                                                    title: Text(document['url'],style: TextStyle(fontSize: 15,color: Colors.amber),),
                                                  ),
                                                ),
                                                onTap: () => _launch(document['url'])
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                                onRefresh: _refresh,
                              );
                          },
                        ),
                        padding: EdgeInsets.only(top: 50),
                      ),
                      (a.length!=0)?Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: ListView.builder(
                              itemCount: a.length,
                              itemBuilder: (BuildContext context,int index){
                                return Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Material(
                                    elevation: 10,
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 10,
                                        ),
                                        ListTile(
                                          leading: Container(
                                            // height: 50,
                                            // width: 40,
                                            child: Image.network(a[index].dp,fit: BoxFit.fill,
                                              loadingBuilder: (BuildContext context,Widget child,ImageChunkEvent loadProgress){
                                                if(loadProgress!=null)
                                                  return CircularProgressIndicator();
                                                else
                                                  return child;
                                              },
                                            ),
                                          ),
                                          title: Text(a[index].title,style: TextStyle(fontSize: 18),),
                                          subtitle: (a[index].subtitle==null)?Container():Text(a[index].subtitle,style: TextStyle(fontSize: 15),),
                                          trailing: IconButton(
                                            icon: Icon(Icons.delete),
                                            onPressed: (){
                                              showDialog(context: context,
                                              builder: (BuildContext context){
                                                return AlertDialog(
                                                  content: Text("Are you sure you want to unsave?",style: TextStyle(fontSize: 15),),
                                                  actions: <Widget>[
                                                    FlatButton(
                                                      child: Text("No",style: TextStyle(fontSize: 15,color: Colors.amber),),
                                                      onPressed: (){
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                    FlatButton(
                                                      child: Text("Yes",style: TextStyle(fontSize: 15,color: Colors.amber),),
                                                      onPressed: (){
                                                        setState(() {
                                                          sharedPreferences.remove(a[index].time);
                                                          Toast.show("Deleted", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM,backgroundColor: Colors.black45);
                                                          a.removeAt(index);

                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                  ],
                                                );
                                              });

                                            },
                                          ),
                                        ),
                                        Container(
                                          //  height: MediaQuery.of(context).size.width-40,
                                          // width:  MediaQuery.of(context).size.width-40,
                                          child: Image.network(a[index].image,fit: BoxFit.fill,
                                            loadingBuilder: (BuildContext context,Widget child,ImageChunkEvent loadProgress){
                                              if(loadProgress!=null)
                                                return Container(
                                                  width: MediaQuery.of(context).size.width-40,
                                                  height: 300,
                                                  child: Center(
                                                    child: CircularProgressIndicator(),
                                                  ),
                                                );
                                              else
                                                return child;
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Container(
                                            width:  MediaQuery.of(context).size.width-40,
                                            child: Text(a[index].desc,style: TextStyle(fontSize: 15),),
                                          ),
                                        ),
                                        (a[index].url==null)?Container():GestureDetector(
                                            child: Container(
                                              width: MediaQuery.of(context).size.width-40,
                                              child: ListTile(
                                                leading: Icon(Icons.link,color: Colors.black,),
                                                title: Text(a[index].url,style: TextStyle(fontSize: 15,color: Colors.amber),),
                                              ),
                                            ),
                                            onTap: () => _launch(a[index].url)
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }
                          )
                      ): Container(
                        height: MediaQuery.of(context).size.height-120,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/introductoryfeed.png'),
                                fit: BoxFit.fill
                            )
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: GestureDetector(
                                child: Container(
                                    color: Color(0xff3F80FA),
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("FEED",style: TextStyle(color: colors[index],fontSize: 15),),
                                        SizedBox(
                                          height: 20,
                                        ),

                                      ],
                                    )
                                ),
                                onTap: (){
                                  if(index!=0)
                                    {
                                      setState(() {
                                        animationController.forward();
                                        index = 0;
                                        controller.jumpToPage(0);
                                      });
                                    }
                                },
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                child: Container(
                                    color: Color(0xff3F80FA),
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("SAVED",style: TextStyle(color: colors[(index==0)?1:0],fontSize: 15),),
                                        SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    )
                                ),
                                onTap: (){
                                  if(index!=1)
                                    {
                                      setState(() {
                                        animationController.forward();
                                        index = 1;
                                        controller.jumpToPage(1);
                                        // loadSharedPref();
                                      });
                                    }
                                },
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          left: left,
                          right: right,
                          bottom: 7.5,
                          child: Container(
                            height: 10.0,
                            width: animation.value,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.amber,
                            ),
                          ),
                        ),
                      ],
                    ),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                  ),

                ],
              ),
          );
        },
      );
  }
  _launch(String url) async {
    if(await canLaunch(url))
      {
        await launch(url);
      }
    else
      {
        throw "Error";
      }
  }
  loadSharedPref() async {
    try{
      final prefs = await SharedPreferences.getInstance();
      a.clear();
      Set<String> set;
      set = prefs.getKeys();
      for(String value in set)
      {
        if(value!='freshInstall')
          {
            print(SavedFeed.fromJson(await sharedPreferences.read(value)).runtimeType);
            SavedFeed s = SavedFeed.fromJson(await sharedPreferences.read(value));
            if(!a.contains(s))
              a.add(s);
          }
      }

    } catch (e){
        print(e);
    }
  }
}
