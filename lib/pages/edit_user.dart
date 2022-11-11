import 'package:flutter/material.dart';

class EditUser extends StatefulWidget {
  const EditUser({super.key});

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  String gender = '';
  final userType = ['Admin', 'User'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              firstNameTextfield(context),
              const SizedBox(height: 20),
              lastNameTextfield(context),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Row(
                  children: [
                    Text(
                      'Gender',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              genderRadio(context),
              const SizedBox(height: 20),
              birthdayText(context),
              const SizedBox(height: 20),
              phoneTextFormField(context),
              const SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                width: MediaQuery.of(context).size.width * 0.8,
                height: 50,
                child: DropdownButton(
                  isExpanded: true,
                  hint: const Text('Select'),
                  items: userType
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container phoneTextFormField(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50,
      child: TextFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            label: Text('Phone'),
            prefixIcon: Icon(Icons.phone)),
      ),
    );
  }

  Container birthdayText(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50,
      child: TextFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            label: Text('Birthday'),
            suffixIcon: Icon(Icons.calendar_month)),
      ),
    );
  }

  Container genderRadio(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Row(
        children: [
          Row(
            children: [
              Radio(
                  value: 'Male',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  }),
              Text('Male')
            ],
          ),
          const SizedBox(width: 30),
          Row(
            children: [
              Radio(
                value: 'Female',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
              Text('Female'),
            ],
          )
        ],
      ),
    );
  }

  Container lastNameTextfield(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text('LastName'),
        ),
      ),
    );
  }

  Container firstNameTextfield(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text('FirstName'),
        ),
      ),
    );
  }
}
