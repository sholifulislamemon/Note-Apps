import 'dart:convert';

import 'package:get/get.dart';

import '../models/note_models.dart';


class NotesController extends GetxController{

  RxList<NoteModels> Notes = <NoteModels> [].obs;

  // *********************** note add function ***********************

  addNote ( NoteModels notedata ){
    Notes.add(notedata);
    update();
  }
  // *********************** note delate fuction  *********************
  delateNote ( int index){
    Notes.removeAt(index);
    update();
  }
  NoteUpdate (int index, NoteModels notedata ){
    Notes[index]= notedata;
    update();
  }

}