import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_taking/screens/create_note_screen.dart';
import 'package:note_taking/screens/edit_note_screen.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  User? userId = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
        title: const Text('Note App'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("notes")
            .where("userId", isEqualTo: userId?.uid)
            .snapshots(),
        builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong!");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CupertinoActivityIndicator());
          }
          if (snapshot.data!.docs.isEmpty) {
            return Center(child: 
            Container( 
                  
             decoration:  BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.amber.shade100,
            
             ),
                      
              child: const  Padding(
                padding: EdgeInsets.symmetric(vertical: 89,horizontal: 24,),
                child: Text("Empty notes",
                style: TextStyle(
                  color: Colors.black87,
                ),),
              ),
              ),);
          }
          if (snapshot.data != null) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var note = snapshot.data!.docs[index]["note"];
                    var docId = snapshot.data!.docs[index].id;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.amber.shade100,
                        child: ListTile(
                          title: Text(
                            note,
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const EditNoteScreen(),
                                      arguments: {
                                        'note': note,
                                        'docId': docId,
                                      });
                                },
                                child: const Icon(Icons.edit,
                                color: Colors.brown,),
                              ),
                              const SizedBox(height: 13),
                              GestureDetector(
                                child: const Icon(Icons.delete,
                                color: Colors.red,),
                                onTap: () async {
                                  await FirebaseFirestore.instance
                                      .collection('notes')
                                      .doc(docId)
                                      .delete();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            );
          }
          return Container();
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const CreateNoteScreen());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
