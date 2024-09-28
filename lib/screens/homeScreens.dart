import 'package:abc/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/notes_controller.dart';
import '../routes/routes_names.dart';
import '../widgets/Custom_single_notes.dart';


class Homescreens extends StatelessWidget {
  const Homescreens({super.key});

  @override
  Widget build(BuildContext context) {
    final controlar = Get.put(NotesController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primeryColor,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: const EdgeInsets.all(40),
                child: Center(
                    child: Text(
                  " My Notes",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.search)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_vert_rounded)),
                    ],
                  )
                ],
              ),
             const  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "  Today ",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text("View All    ",
                    style: TextStyle(
                      fontSize: 18,
                    ))
              ]),
             const SizedBox(
                height: 15,
              ),
              Obx(
                () => Expanded(
                  child: controlar.Notes.isEmpty
                      ? const Center(
                          child: Text(
                            " You have a Empty note!",
                            style: TextStyle(fontSize: 25),
                          ),
                        )
                      : ListView.builder(
                          itemCount: controlar.Notes.length,
                          reverse: controlar.Notes.length == 5? true: false,
                          itemBuilder: (context, index) {                            
                            return CustomSingleNotes(index: index,);
                          },

                        ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(RoutesNames.notes_screen);
          },
          child: Icon(Icons.add),
          shape: CircleBorder(),
        ),
      ),
    );
  }
}
