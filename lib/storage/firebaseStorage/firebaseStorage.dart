import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: FireStorage1(),));
}
class FireStorage1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FireStorage1State();
}

class FireStorage1State extends State {
  FirebaseStorage storage = FirebaseStorage.instance;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                    onPressed: () => upload('camera'),
                    icon: const Icon(Icons.camera_alt),
                    label: const Text("Camera")),
                ElevatedButton.icon(
                    onPressed: () => upload('gallery'),
                    icon: const Icon(Icons.photo),
                    label: const Text("Gallery")),
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
                            itemBuilder: (context, index) {});
                      }
                      return const Center(child: CircularProgressIndicator());
                    }))
          ],
        ),
      ),
    );
  }

  loadData() {}

  Future<void> upload(String imginput) async {
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
              'uploaded_by': "it me xxxx",
              'description': 'Some Description........'
            }));
        setState(() {});
      } on FirebaseException catch (e) {
        print(e);
      }
    } catch (e) {
      print(e);
    }
  }
}