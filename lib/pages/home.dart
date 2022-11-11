import 'package:flutter/material.dart';
import 'package:flutter_basic_crud/pages/add_user.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/man.png',
                        width: 60,
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Chouayeethao Churching'),
                          Text('2098759831')
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ),
                      ),
                      IconButton(
                      
                        onPressed: () {
                          showDialog(context: context, builder: (context) => AlertDialog(
                            title: Text('Delete'),
                            content: Text('Do you want to delete this item'),
                            actions: [
                              TextButton(onPressed: () {}, child: Text('Cancel')), 
                               TextButton(onPressed: (){}, child: Text('Delete', style: TextStyle(color: Colors.red),))
                            ],
                          ),);
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
