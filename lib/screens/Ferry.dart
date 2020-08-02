import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//widget for the my profile page displaying user's details
class Ferry extends StatefulWidget {
  static const id = "ferry";
  @override
  _FerryState createState() => _FerryState();
}

class _FerryState extends State<Ferry> {
  List<String> ng_g_WD = [];
  List<String> g_ng_WD = [];
  List<String> ng_g_S = [];
  List<String> g_ng_S = [];
  List<String> dropdownList = ['Working Days', 'Sunday'];
  String dropdownValue;

  Future<dynamic> getFerryTimings() async {
    final _queryList = await Firestore.instance.collection("FerryTimings").getDocuments();
    final _doc = _queryList.documents[0];
    return _doc.data;
  }

  @override
  void initState() {
    print("Initstate called");
    try {
      getFerryTimings().then((value) {
        print(value.toString());
        ng_g_WD = value['NGtoG_workingdays'];
        ng_g_S = value['NGtoG_sunday'];
        g_ng_S = value['GtoNG_Sunday'];
        g_ng_WD = value['GtoNG_Workingdays'];
      });
    } catch (e) {
      print("------------ERROR------------");
      print(e.toString());
    }
    print(ng_g_S.toString());
    dropdownValue = dropdownList[0]; // initial value of dropdown
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('timings'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  'Ferry',
                  textAlign: TextAlign.center,
                  textScaleFactor: 3.0,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
              ),
              DropdownButton(
                underline: Container(),
                value: dropdownValue,
                items: dropdownList
                    .map<DropdownMenuItem>(
                      (item) => DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    dropdownValue = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Builder(
                builder: (context) {
                  List<String> _list;
                  if (dropdownValue != dropdownList[1])
                    _list = g_ng_WD;
                  else
                    _list = g_ng_S;

                  return ExpandablePanel(
                    header: Container(
                      color: Colors.amber,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.accessibility,
                            color: Colors.black54,
                          ),
                          SizedBox(width: 20),
                          Text(
                            "Guwahti -> Campus",
                            style: Theme.of(context).textTheme.headline2.copyWith(
                                  fontSize: 25,
                                ),
                          ),
                        ],
                      ),
                    ),
                    collapsed: Text("Guwahti -> Campus"),
                    expanded: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: _list
                          .map<ListTile>(
                            (item) => ListTile(
                              title: Text(item),
                              leading: Icon(Icons.access_time),
                            ),
                          )
                          .toList(),
                    ),
                  );
                },
              ),
              Builder(
                builder: (context) {
                  List<String> _list;
                  if (dropdownValue != dropdownList[1])
                    _list = ng_g_WD;
                  else
                    _list = ng_g_S;

                  return ExpandablePanel(
                    header: Container(
                      color: Colors.amber,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.accessibility,
                            color: Colors.black54,
                          ),
                          SizedBox(width: 20),
                          Text(
                            "Campus -> Guwahtu",
                            style: Theme.of(context).textTheme.headline2.copyWith(
                                  fontSize: 25,
                                ),
                          ),
                        ],
                      ),
                    ),
                    collapsed: Text("Campus -> Guwahti"),
                    expanded: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: _list
                          .map<ListTile>(
                            (item) => ListTile(
                              title: Text(item),
                              leading: Icon(Icons.access_time),
                            ),
                          )
                          .toList(),
                    ),
                  );
                },
              ),
            ],
          ),
        )),
      ),
    );
  }
}