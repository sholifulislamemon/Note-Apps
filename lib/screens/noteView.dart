import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/notes_controller.dart';
import '../models/note_models.dart';


class Noteview extends StatelessWidget {

  const Noteview({super.key});

  @override
  Widget build(BuildContext context) {



    final Controller = Get.put(NotesController());


    final arg = Get.arguments != null ?
        Get.arguments as Map :
        {
          "isupdate" : false,
          "note": null,
        };
    final bool isupdate = arg ["isupdate"]?? false;
    final note = arg ["note"] ==null ? null :arg ["note"] as NoteModels;
    final int? index = arg["index"]== null ? null : arg ["index"] as int ;


    final titleController = TextEditingController(
      text: isupdate ? note!.title : null
    );
    final SubtitleController = TextEditingController(
        text: isupdate ? note!.subtitle: null
    );

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton( onPressed: (){
          Get.back();
        },icon: Icon(Icons.arrow_back),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.attachment_rounded)),
          IconButton(onPressed: (){}, icon: Icon(Icons.share)),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_rounded)),
        ],
        bottom:PreferredSize(
          child:Divider(height: 1,),preferredSize: Size.square(1),
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              style: TextStyle(color: Colors.black, fontSize: 30,fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                hintText: "Title",
                hintStyle: TextStyle(color: Colors.black.withOpacity(.8), fontSize: 30,fontWeight: FontWeight.bold),
                border: InputBorder.none
              ),
            ),
            Expanded(
              child: TextField(
                controller: SubtitleController,
                minLines: 1,
                maxLines: 50,
                style: const TextStyle(fontSize: 20),
                decoration: const InputDecoration(
                    hintText: "Description",
                    hintStyle: TextStyle(fontSize: 20,),
                    border: InputBorder.none
                ),
              ),
            ),
          ],
        ),
      ),
    bottomNavigationBar:

    Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: (){
          if( titleController.text.isEmpty ||SubtitleController.text.isEmpty ) {
            Get.snackbar("Empty", " Title or subtitle is Empty! ");
          } else{
            // print(" title ${titleController.text} \n subtitle ${ SubtitleController.text}");
            isupdate? Controller.NoteUpdate(index!, NoteModels(
                title: titleController.text,
                subtitle: SubtitleController.text,
                createddate: note!.createddate,
                updateddate:DateTime.now() ))
            :
            Controller.addNote(NoteModels(
                title: titleController.text,
                subtitle: SubtitleController.text,
                createddate: DateTime.now()

            ));
            Get.back();
          }
        },
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
                " Save Changees",style: TextStyle(
              color: Colors.white,
              fontSize: 25
            ),
            ),
          ),
        ),
      ),
    ),
      );
  }
}
