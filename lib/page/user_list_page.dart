import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:study_package/model/inputform.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  late Box _darkMode;
  late Box<InputForm> _inputFormBox;

  @override
  void initState() {
    super.initState();
    _darkMode = Hive.box('darkModeBox');
    _inputFormBox = Hive.box<InputForm>('inputFormBox');
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final darkMode =
        Hive.box('darkModeBox').get('darkMode', defaultValue: false);

    return Scaffold(
      appBar: AppBar(
        actions: [
          CupertinoSwitch(
            value: darkMode,
            onChanged: (val) {
              setState(() {
                _darkMode.put('darkMode', val);
              });
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  label: Text('name'),
                ),
              ),
              TextField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text('age'),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _inputFormBox.add(
                    InputForm(
                      name: nameController.text,
                      age: int.parse(ageController.text),
                    ),
                  );
                },
                child: const Text('add'),
              ),
            ],
          ),
          const Divider(),
          ValueListenableBuilder(
            valueListenable: Hive.box<InputForm>('inputFormBox').listenable(),
            builder: (context, Box<InputForm> inputFormBox, widget) {
              final users = inputFormBox.values.toList();

              return Expanded(
                child: users.isEmpty
                    ? const Text('empty')
                    : ListView.builder(
                        itemCount: users.length,
                        itemBuilder: (context, i) {
                          return ListTile(
                            title: Text(users[i].name),
                            subtitle: Text(users[i].age.toString()),
                          );
                        },
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
