import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/notes_controller.dart';
import '../routes/routes_names.dart';
import '../utils/colors.dart';

class CustomSingleNotes extends StatelessWidget {


  final int index;

  const CustomSingleNotes({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final controller= Get.put( NotesController());
    final note= controller.Notes[index];
    final createddateFormet = DateFormat.yMEd().format(note.createddate);
    final createdtimeFormet = DateFormat.jm().format(note.createddate);

    final UPdeteddateFormet = DateFormat.yMEd().format(note.updateddate ?? DateTime.now());
    final updetedtimeFormet = DateFormat.jm().format(note.updateddate ?? DateTime.now() );
    return InkWell(
      onTap: (){
        Get.toNamed(
          RoutesNames.notes_screen,
          arguments: {
            "isupdate": true,
            "note": note,
            "index": index
          }
        );
      },

      child: Column(
        children: [
          SizedBox(height: 10,),
      Container(

      decoration: BoxDecoration(
      color: CupertinoColors.white,
          borderRadius: BorderRadius.all(Radius.circular(25))


      ),
      child: ListTile
      (
      horizontalTitleGap: 0,

      leading:
      Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
      color: AppColors.primeryColor,
      shape: BoxShape.circle
      ),
      ),

      title: Text( note.title ,style: TextStyle( fontSize: 20,fontWeight: FontWeight.bold),),
      subtitle:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(note.subtitle,style: TextStyle( fontSize: 18,),maxLines: 1,overflow:TextOverflow.ellipsis,),
      note.updateddate != null ? Text(" ${ createdtimeFormet} ${ createddateFormet}"): SizedBox(),
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text(" ${ createdtimeFormet} ${ createddateFormet}"),
      IconButton(onPressed: (){

        controller.delateNote(index);
        Get.defaultDialog(
          title: "Deleted",
          backgroundColor: Colors.white,
          content: Text(" you have deleted ${ note.title}"),
          onConfirm:(){
            Get.back();
          },
        );

      }, icon: Icon(Icons.delete)),

      ],
      )
      ],
      )


      )
      )
        ],
      ),
    );
  }
}
