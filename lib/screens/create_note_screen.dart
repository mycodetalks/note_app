import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_taking/home.dart';


class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({super.key});

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  TextEditingController noteController = TextEditingController();
  User? userId = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a note'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              controller: noteController,
              maxLines: null,
              decoration: const InputDecoration(hintText: 'Add note'),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var note = noteController.text.trim();
              if (note != "") {
                try {
                  await FirebaseFirestore.instance
                      .collection("notes")
                      .doc()
                      .set({
                    "creation date": DateTime.now(),
                    "note": note,
                    "userId": userId?.uid,
                  }).then((value) => {
                            Get.offAll(() => const Home()),
                          });
                } catch (e) {
                  const  Text("Opps");
                }
              }
            },
            child: const Text('Add note'),
          ),
        ],
      ),
    );
  }
}
