


import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';


imageUploadCamera()async{
  

  final XFile?  image  = await ImagePicker().pickImage(
    source: ImageSource.camera,
    imageQuality: 90,
  );
  if (image != null) {
    return File(image.path);
  }
  else{return null;}
}








imageUploadGallery()async{

  FilePickerResult? result = await FilePicker.platform.pickFiles(

    type: FileType.custom,
    allowedExtensions:
    [
      'svg',
      'SVG',
      'png',
      'PNG',
      'jpg',
      'jpeg',
      'gif'
    ],

  );

  if (result != null) {
   return File(result.files.single.path!);
  }
  else{return null;}
}
