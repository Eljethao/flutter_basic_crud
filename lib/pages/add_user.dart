import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  String gender = '';
  bool firstNameVal = false;
  String? chooseUserType;
  final userType = ['Admin', 'User'];
  DateTime selected = DateTime.now();
  DateFormat formatter = DateFormat('dd/MM/yyyy');
  TextEditingController birthdayController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selected,
        firstDate: DateTime(1975, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selected) {
      setState(() {
        selected = picked;
        birthdayController.text = formatter.format(selected);
      });
    }
  }

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
                  value: chooseUserType,
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
                  onChanged: (value) {
                    setState(() {
                      chooseUserType = value;
                    });
                  },
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                      onPressed: () {
                        print('firstname: ${firstnameController.text}');
                        print('lastname: ${lastnameController.text}');
                        print('gender: ${gender}');
                        print('birthday: ${birthdayController.text}');
                        print('phoneNumber: ${phoneController.text}');
                        print('status: ${chooseUserType}');

                        if (firstnameController.text.isEmpty) {
                          setState(() {
                            firstNameVal = true;
                          });
                        } else {
                          setState(() {
                            firstNameVal = false;
                          });
                        }
                      },
                      child: Text('Save'))),
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
        controller: phoneController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            label: Text('Phone'),
            prefixIcon: Icon(Icons.phone)),
      ),
    );
  }

  Widget birthdayText(BuildContext context) {
    return InkWell(
      onTap: () => _selectDate(context),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 50,
        child: IgnorePointer(
          child: TextFormField(
            controller: birthdayController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Birthday'),
                suffixIcon: Icon(Icons.calendar_month)),
          ),
        ),
      ),
    );
  }

  Widget genderRadio(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
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
        ),
        gender == ""
            ? Container(
              width: MediaQuery.of(context).size.width * 0.8,
                child: Row(
                  children: [
                    Text('Please select gender ',
                        style: TextStyle(color: Colors.red)),
                  ],
                ))
            : Container(),
      ],
    );
  }

  Container lastNameTextfield(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50,
      child: TextField(
        controller: lastnameController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text('LastName'),
        ),
      ),
    );
  }

  Widget firstNameTextfield(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 70,
          child: TextField(
            controller: firstnameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text('FirstName'),
              errorText: firstNameVal ? 'Please input first name' : null,
            ),
          ),
        ),
        // firstnameController.text.isEmpty
        //     ? Text(
        //         'Please input your firstname',
        //         style: TextStyle(color: Colors.red),
        //       )
        //     : Container()
      ],
    );
  }
}
