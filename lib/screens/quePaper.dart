import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:onestop_ios/screens/upload_paper.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:onestop_ios/screens/view_paper.dart';


import '../paper_def.dart';

class quePaper extends StatefulWidget{
  @override
  _quePaperState createState() => _quePaperState();
}

class _quePaperState extends State<quePaper>
{
    String course='';
    String year='';
    String dropdownValue = ' Type of Paper                                                   ';

    final Controller1 = TextEditingController();
    final Controller2 = TextEditingController();
    @override
   void dispose(){
      Controller1.dispose();
      Controller2.dispose();
      super.dispose();
    }

    @override
   Widget build(BuildContext context)
    {
       return Scaffold(
         appBar: AppBar(
           title: Text("Previous Years' Papers"),
           backgroundColor: Color(0xff3F80FA),
         ),
         body: Padding(
           padding: const EdgeInsets.all(30.0),
           child: Column(
             children: <Widget>[
               TextField(
                 decoration: InputDecoration(
                   hintText: 'Course Code (Eg: CS222)'
                 ),
                 controller: Controller1,
               ),
           SizedBox(height: 30),
           DropdownButton<String>(
             value: dropdownValue,
             icon: Icon(Icons.arrow_drop_down),
             iconSize: 24,
             elevation: 16,
             style: TextStyle(
                 color: Colors.grey,
               fontSize: 17.0,
             ),

             onChanged: (String newValue) {
               setState(() {
                 dropdownValue = newValue;
               });
             },
             items: <String>[' Type of Paper                                                   ', 'Quiz 1', 'Midsem', 'Quiz 2', 'Endsem', 'Others']
                 .map<DropdownMenuItem<String>>((String value) {
               return DropdownMenuItem<String>(
                 value: value,
                 child: Text(value),
               );
             })
                 .toList(),
           ),
               SizedBox(height: 30),
               TextField(
                 decoration: InputDecoration(
                   hintText: 'Year of Examination (Optional)'
                 ),
                 controller: Controller2,

               ),
               SizedBox(height: 30),
               Container(
                 margin: EdgeInsets.all(16),
                 width: 220,
                 height: 50,

                 child: FlatButton(onPressed: () async {

                   course=Controller1.text;
                   year=Controller2.text;
                   print(course);
                   print(year);
                   if(course=='')
                     {
                         Fluttertoast.showToast(msg: 'Course code cannot be empty',backgroundColor: Colors.white70,textColor: Colors.black);
                     }
                   else if(dropdownValue == ' Type of Paper                                                   ')
                     {
                        Fluttertoast.showToast(msg: 'Please select a paper type',backgroundColor: Colors.white70 ,textColor: Colors.black);
                     }
                   else
                     {

                       String Year=year;
                       String CourseCode=course.toUpperCase();
                       String Type=dropdownValue;
                       List<paper> list=new List();
                       if(Year!="")
                       {DatabaseReference ref=await FirebaseDatabase.instance.reference().child('Uploads/'+CourseCode+'_'+Type+'/'+Year);
                       await ref.once().then((DataSnapshot snapshot)
                       {
                         Map<dynamic,dynamic> map=snapshot.value;
                         map.forEach((key, value) {
                           // print(value);
                           list.add(new paper.fromSnapshot(value));

                         });

                       });}

                       else
                       {
                         DatabaseReference ref=await FirebaseDatabase.instance.reference().child('Uploads/'+CourseCode+'_'+Type);
                         await ref.once().then((DataSnapshot snapshot)
                         {
                           Map<dynamic,dynamic> map=snapshot.value;
                           map.forEach((key, value) {
                             Map<dynamic,dynamic> map1=value;
                             map1.forEach((key, value1) {
                               list.add(paper.fromSnapshot(value1));
                             });
                           });
                         });
                       }
                       Navigator.push(context, MaterialPageRoute(
                         builder: (context)=> view_paper(list: list),
                       ),);

                     }




                 }, child: Text('FIND PAPER',style: new TextStyle(fontSize: 20),), color: Colors.amber, textColor: Colors.white,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(25.0),

                 ),
                 ),
               ),

             ],
           ),
         ),
         floatingActionButton: FloatingActionButton(
           onPressed: (){
             Navigator.push(context, MaterialPageRoute(
               builder: (context)=> uploadPaper(),
             ),);
             print('done');
           },
           backgroundColor: Colors.amber,
           child: Icon(Icons.file_upload),
         ),
       );
    }

}
