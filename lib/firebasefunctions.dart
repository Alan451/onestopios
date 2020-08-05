import 'dart:async';
import 'dart:io';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import 'package:fluttertoast/fluttertoast.dart';

void add_paper(BuildContext context,File file)
async{

  bool uploaded=await uploadfile(file);
  if(uploaded)  Fluttertoast.showToast(msg: 'Uploaded',backgroundColor: Colors.white70,textColor: Colors.black);
  else Fluttertoast.showToast(msg: 'Upload failed',backgroundColor: Colors.white70,textColor: Colors.black);
}

Future<File> pick_file()
async {
     return await FilePicker.getFile(type: FileType.custom,allowedExtensions: ['pdf']);
}

Future<bool> uploadfile(File file)
async
{

  if(file==null) return false;


  return await savePdf(file,basename(file.path));
}
Future<bool> savePdf(File file, String name)async{
  StorageReference reference= FirebaseStorage.instance.ref().child("Uploads/$name");
  final StorageUploadTask uploadTask= reference.putFile(file);
  final StorageTaskSnapshot downloadUrl = await uploadTask.onComplete.catchError((error)
  {
     print(error);
     return null;
  });
  final String url = (await downloadUrl.ref.getDownloadURL());
  print(url);
  if(downloadUrl!=null) return true;
  return false;
}