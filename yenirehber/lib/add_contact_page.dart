import 'package:flutter/material.dart';
import 'package:yenirehber/Model/Contact.dart';

class AddContactPage extends StatefulWidget {
  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  @override
  Widget build(BuildContext context) {
    contactlist.contacts.add(contactlist("recep", "5050575815"));
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Contact"),
      ),
      body: AddContactForm(),
    );
  }
}

class AddContactForm extends StatefulWidget {
  @override
  _AddContactFormState createState() => _AddContactFormState();
}

class _AddContactFormState extends State<AddContactForm> {
  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    String name;
    String phonenumber;
    return Padding(
      padding: EdgeInsets.all(10),
      child: Form(
        key: formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "this field is not empty";
                    }
                  },
                  decoration: InputDecoration(hintText: "username"),
                  keyboardType: TextInputType.name,
                  onSaved: (newValue) => name = newValue,
                )),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "this field is not empty";
                    }
                  },
                  decoration: InputDecoration(hintText: "Phone Number"),
                  keyboardType: TextInputType.phone,
                  maxLength: 11,
                  onSaved: (newValue) => phonenumber = newValue,
                )),
            RaisedButton(
              onPressed: () {
                if (formkey.currentState.validate()) {
                  formkey.currentState.save();
                  contactlist.contacts.add(contactlist(name, phonenumber));
                  var snackbar = Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("$name has been saved"),
                    duration: Duration(milliseconds: 300),
                  ));
                  snackbar.closed.then((value) => Navigator.pop(context));
                }
              },
              color: Colors.blue,
              textColor: Colors.white,
              child: Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}
