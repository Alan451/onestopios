import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:onestop_ios/screens/upload_paper.dart';

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

                 child: FlatButton(onPressed: (){

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
                       //TODO add the screen
                       print('done');
                     }

                   print(course);
                   print(year);


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
