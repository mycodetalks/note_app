
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_taking/home.dart';


class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  TextEditingController noteEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text(
          'Edit note',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: noteEditingController
                ..text = Get.arguments['note'].toString(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  await FirebaseFirestore.instance
                      .collection('notes')
                      .doc(Get.arguments['docId'].toString())
                      .update(
                    {
                      'note': noteEditingController.text.trim(),
                    },
                  ).then((value) => {
                            Get.offAll(() => const Home()),
                          });
                },
                child: const  Text("Edit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
