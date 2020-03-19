import 'package:estudando_flutter2/dao/contact_dao.dart';
import 'package:estudando_flutter2/models/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {

  final ContactDao contactDao;

  ContactForm({@required this.contactDao});

  @override
  State<StatefulWidget> createState() => _ContactFormState(contactDao: contactDao);
}

class _ContactFormState extends State<ContactForm> {
  
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();

  // final ContactDao _dao = ContactDao();

  final ContactDao contactDao;

  _ContactFormState({@required this.contactDao});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar( title: Text('New contact'), ),
       body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                        children: <Widget>[
                            TextField(
                              controller: _nameController,
                              decoration: InputDecoration( labelText:  'Full name', ),
                              style: TextStyle( fontSize: 24.0, ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: TextField(
                                      controller: _accountNumberController,
                                      decoration: InputDecoration( labelText:  'Account number', ),
                                      style: TextStyle( fontSize: 24.0, ),
                                      keyboardType: TextInputType.number,
                                    ),  
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 16.0), 
                              child: SizedBox(
                                      width: double.maxFinite,   
                                      child: RaisedButton(
                                                child: Text('Create'),
                                                onPressed: (){
                                                    final String name = _nameController.text;
                                                    final int accountNumber = int.tryParse(_accountNumberController.text);

                                                    final Contact newContact = Contact(0, name, accountNumber);

                                                    _save(newContact, context);

                                                    /*
                                                    contactDao.save(newContact).then( (id) => 
                                                      Navigator.pop(context)
                                                    );
                                                    */
                                               },
                                            ),
                              ),
                            ),
                        ],
                      ),
                ),
      
    );
  }


  void _save(Contact newContact, BuildContext context) async {
    await contactDao.save(newContact).then( (id) => 
      Navigator.pop(context)
    );
  }
}