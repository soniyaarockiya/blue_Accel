import 'package:blue_accel/constants/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:blue_accel/service/firebase_service.dart';

class NewArticlePage extends StatefulWidget {
  @override
  _NewArticlePageState createState() => _NewArticlePageState();
}

class _NewArticlePageState extends State<NewArticlePage> {
  final formKey = new GlobalKey<FormState>();
  FireBaseService _fireBaseService = new FireBaseService();
  String title;
  String description;
  String articleData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration:
                        kTextFieldInputDecoration.copyWith(hintText: 'Title'),
                    validator: (value) => value.isEmpty ? 'Add title' : null,
                    onSaved: (value) => title = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: kTextFieldInputDecoration.copyWith(
                        hintText: 'Description'),
                    validator: (value) =>
                        value.isEmpty ? 'Add description' : null,
                    onSaved: (value) => description = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    decoration:
                        kTextFieldInputDecoration.copyWith(hintText: 'Article'),
                    validator: (value) => value.isEmpty ? 'Add article' : null,
                    onSaved: (value) => articleData = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    child: Text('Save'),
                    onPressed: validateAndSubmit,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      //if you don't save the form , it returns null.
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      formKey.currentState.reset();
      await _fireBaseService.addToFireBase(title, description, articleData);
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Saved....!"),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blueGrey,
      ));
    }
  }
}
