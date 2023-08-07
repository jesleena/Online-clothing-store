import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox('todo_box');
  runApp(MaterialApp(
    builder: FToastBuilder(),
    home: CRUD_HIVE(),));
}

class CRUD_HIVE extends StatefulWidget {
  @override
  State<CRUD_HIVE> createState() => _CRUD_HIVEState();
}

class _CRUD_HIVEState extends State<CRUD_HIVE> {
  List<Map<String, dynamic>> task = [];
  final tname    = TextEditingController();
  final tcontent = TextEditingController();

  //creating hive box
  final box = Hive.box('todo_box');

  @override
  void initState() {
    refresh_or_read_task();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("MY TODO"),
        ),
        body: task.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
            itemCount: task.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.task),
                  title: Text(task[index]['taskname']),
                  subtitle: Text(task[index]['taskcontent']),
                  trailing: Wrap(
                    children: [
                      IconButton(
                          onPressed: () {
                            create_or_edit_Task(task[index]['id']);
                          }, icon: const Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            deleteTask(task[index]['id']);
                          }, icon: const Icon(Icons.delete))
                    ],
                  ),
                ),
              );
            }),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () => create_or_edit_Task(null),
            label: Icon(Icons.add)));
  }

  void create_or_edit_Task(int? itemkey) {
    // item key similar to id in sqflite
   if (itemkey != null) //to get values to ui
   {
      final existing_task = task.firstWhere((element) => element['id']== itemkey);
      tname.text    = existing_task['taskname'];
     tcontent.text = existing_task['taskcontent'];
   }
    showModalBottomSheet(
        isScrollControlled: true,
        elevation: 5,
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
              top: 15,
              bottom: MediaQuery.of(context).viewInsets.bottom + 120,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: tname,
                  decoration: InputDecoration(
                      hintText: 'Task Name'),
                ),
                TextField(
                  controller: tcontent,
                  decoration: InputDecoration(
                      hintText: 'Task Content'),
                ),
                ElevatedButton(
                    onPressed: (){
                      if(itemkey == null){
                        createTask(
                            {
                              "task_name":tname.text.trim(),
                              "task_cont":tcontent.text.trim()
                            }
                        );
                      }
                      if(itemkey != null){
                        ///edit the values that particular key in hive

                        editTask(itemkey,{
                          'task_name':tname.text.trim(),
                          'task_cont':tcontent.text.trim()
                        });
                      }

                      tname.text="";
                      tcontent.text="";
                      Navigator.pop(context);
                    },
                    child: Text(
                        itemkey == null ? 'Create Task': 'Edit Task'
                    ))
              ],
            ),
          );
        });

  }

  void refresh_or_read_task() {
    // fetch all the keys from hive in ascending order
    // key - individual itemkeys will be available at key
    final task_from_hive = box.keys.map((key) {

      final map_of_that_single_key = box.get(key);

      return {
        'id' : key,   // key 1 key 2 etc
        'taskname'   :map_of_that_single_key['task_name'],
        'taskcontent':map_of_that_single_key['task_cont']
      };
    }).toList();

    setState(() {
      task = task_from_hive.reversed.toList();
    });
  }

  Future<void> createTask(Map<String, dynamic> newtask) async {
    await box.add(newtask);
    refresh_or_read_task();
  }

  Future<void> editTask(int itemkey, Map<String, dynamic> editedtask) async{
    await box.put(itemkey, editedtask);
    refresh_or_read_task();
  }

  Future<void> deleteTask(int itemkey) async{
    await box.delete(itemkey);
    refresh_or_read_task();

    Fluttertoast.showToast(
        msg: "Successfully Deleted",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        //timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}