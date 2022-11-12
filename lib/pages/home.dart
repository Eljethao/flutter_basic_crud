import 'package:flutter/material.dart';
import 'package:flutter_basic_crud/pages/add_user.dart';
import 'package:flutter_basic_crud/pages/edit_user.dart';
import 'package:flutter_basic_crud/services/user_services.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var userData;
  DateFormat formatter = DateFormat('dd/MM/yyyy');

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  getUserData() async {
    var data = await UserService().getAllUser();
    print("data ==>>> $data");
    setState(() {
      userData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddUser(),
              ));
        },
        child: Icon(Icons.add),
      ),
      body: userData == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: userData.length,
              itemBuilder: (context, index) => Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            userData[index]["gender"] == "MALE"
                                ? Image.asset(
                                    'assets/images/man.png',
                                    width: 60,
                                  )
                                : Image.asset(
                                    "assets/images/woman.png",
                                    width: 60,
                                  ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    '${userData[index]["firtname"]} ${userData[index]["lastname"]}'),
                                Text('${userData[index]["phone"]}'),
                                Text('${userData[index]["role"]}'),
                                Text('${formatter.format(
                                  DateTime.parse(userData[index]["birthDay"]),
                                )}')
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditUser(),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.edit,
                                color: Colors.blue,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Delete'),
                                    content:
                                        Text('Do you want to delete this item'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {},
                                          child: Text('Cancel')),
                                      TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Delete',
                                            style: TextStyle(color: Colors.red),
                                          ))
                                    ],
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                ],
              ),
            ),
    );
  }
}
