import 'package:flutter/material.dart';

import 'Model/Contact.dart';
import 'add_contact_page.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final List<contactlist> contacts = contactlist.contacts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddContactPage(),
              ));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("merhaba"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
          child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (BuildContext context, int index) {
                contactlist contact = contacts[index];
                return Dismissible(
                  onDismissed: (direction) {
                    setState(() {
                      contacts.removeAt(index);
                    });

                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("${contact.name} silindi bebeğim"),
                      action: SnackBarAction(label: "Undo", onPressed: () {}),
                    ));
                  },
                  key: Key(contact.name),
                  child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage("assets/asda"),
                                child: Text(contact.name[0]),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(contact.name),
                                    Text(contact.phonenumber)
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 2,
                          )
                        ],
                      )),
                );
              })),
    );
  }
}
