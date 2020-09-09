import 'dart:async';
import 'dart:io';
import 'dart:core';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:onestop_ios/paper_def.dart';
import 'package:path/path.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

String kTestString="test";

void add_paper(BuildContext context,File file,String course,String type,String year,String professor)
async{

  bool uploaded=await uploadfile(file,course,type,professor,year);
  if(uploaded)  Fluttertoast.showToast(msg: 'Uploaded',backgroundColor: Colors.white70,textColor: Colors.black);
  else Fluttertoast.showToast(msg: 'Upload failed',backgroundColor: Colors.white70,textColor: Colors.black);

}

Future<File> pick_file()
async {
     return await FilePicker.getFile(type: FileType.custom,allowedExtensions: ['pdf']);
}

Future<bool> uploadfile(File file,String course,String type,String professor,String year)
async
{

  if(file==null) return false;


  return await savePdf(file,basename(file.path),course,type,professor,year);
}
Future<bool> savePdf(File file, String name,String course,String type,String professor, String year)async{
  StorageReference reference= FirebaseStorage.instance.ref().child("Uploads/$name");
  final StorageUploadTask uploadTask= reference.putFile(file);
  final StorageTaskSnapshot downloadUrl = await uploadTask.onComplete.catchError((error)
  {
     print(error);
     return null;
  });
  final String url = (await downloadUrl.ref.getDownloadURL());
  paper que=new paper(course, type, professor, url, year);
  String date=DateTime.now().day.toString()+'-'+DateTime.now().month.toString()+'-'+DateTime.now().year.toString();
  DatabaseReference ref= FirebaseDatabase.instance.reference().child('Uploads/'+course+'_'+type+'/'+year);
  ref.push().set({'CourseCode':course,'Type':type,'FileUrl':url,'Prof':professor,'Year':year,'DateofUpload':date,'FileName':name,
  'downvoteCount':0,'downvoters':{'0':'Dummy mail'},'totalVotes':0,'uploaderID': 'abc','upvoteCount':0,'upvoters':{'0':"Dummy Mail"}});
  print(url);
  if(downloadUrl!=null) return true;
  return false;
}
