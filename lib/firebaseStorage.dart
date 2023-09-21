import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: FireStorageeee(),
  ));
}

class FireStorageeee extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FireStorageeeeState();
}

class FireStorageeeeState extends State {
  FirebaseStorage storage = FirebaseStorage.instance;
  final uname = TextEditingController();
  final desc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store Images etc'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: uname,
                    decoration: const InputDecoration(border: OutlineInputBorder(),
                        hintText: "item name",
                        labelText: "item name",
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: desc,
                    decoration: const InputDecoration(border: OutlineInputBorder(),
                        hintText: "description",
                         labelText: "description",
                         ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                        onPressed: () => upload('camera',uname.text,desc.text),
                        icon: const Icon(Icons.camera_alt),
                        label: const Text("Camera")),
                    ElevatedButton.icon(
                        onPressed: () => upload('gallery',uname.text,desc.text),
                        icon: const Icon(Icons.photo),
                        label: const Text("Gallery")),
                  ],
                ),

              ],
            ),
            Expanded(
                child: FutureBuilder(
                  // if firebase connection is success load data from firebase
                    future: loadData(),
                    builder: (context,
                        AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return ListView.builder(
                            itemCount:snapshot.data?.length ?? 0 ,
                            itemBuilder: (context, index) {
                              final Map<String, dynamic> image = snapshot.data![index];
                              return   Card(

                                margin: EdgeInsets.fromLTRB(5, 0, 2, 0),
                                child: Column(

                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(3),
                                      width: 300,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(topRight: Radius.circular(10.0),topLeft: Radius.circular(10.0)),
                                        image: DecorationImage(
                                          image: NetworkImage(image['url']),
                                          fit: BoxFit.cover,
                                        ),),),
                                    Container(
                                        width: 300,

                                        child: Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(children: [
                                              Text(image['uploaded_by'],style: Theme.of(context).textTheme.bodyLarge),

                                              Text((image['description']),style: Theme.of(context).textTheme.bodyMedium),


                                            ]),
                                            IconButton(
                                                onPressed: () {
                                                  deleteImage(image['path']);
                                                }, icon: const Icon(Icons.delete)),
                                          ],
                                        )),

                                  ],), );


                            });
                      }
                      return const Center(child: CircularProgressIndicator());
                    }))
          ],
        ),
      ),
    );
  }

  Future<List<Map<String, dynamic>>> loadData() async {
    List<Map<String, dynamic>> images = [];
    final ListResult result = await storage.ref( ).list();
    final List<Reference> allfiles = result.items;

    await Future.forEach(allfiles, (singleFile) async {
      final String fileurl = await singleFile.getDownloadURL();

      final FullMetadata filemeta = await singleFile.getMetadata();

      images.add({
        'url': fileurl,
        'path': singleFile.fullPath,
        'uploaded_by': filemeta.customMetadata?['uploaded_by'] ?? 'No Data',
        'description':
        filemeta.customMetadata?['description'] ?? 'No Description'
      });
    });
    return images;
  }

  Future<void> upload(String imginput,String uploaded,String descr) async {
    final picker = ImagePicker();
    XFile? pickedImage; // store platform dependent image path

    try {
      pickedImage = await picker.pickImage(
          source: imginput == 'camera' ? ImageSource.camera : ImageSource.gallery,
          maxWidth: 1920);
      final String filename = path.basename(pickedImage!.path);
      File imageFile = File(pickedImage.path); // platform independent path where operations can be performed

      try {
        await storage.ref(filename).putFile(
            imageFile,
            SettableMetadata(customMetadata: {
             'uploaded_by':uname.text ,
              'description': desc.text,
            }));
        setState(() {});
      } on FirebaseException catch (e) {
        print(e);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteImage(String imagepath) async{
    await storage.ref(imagepath).delete();
    setState(() {});
  }
}