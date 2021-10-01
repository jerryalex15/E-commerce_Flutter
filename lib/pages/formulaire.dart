import 'dart:async';

import 'package:flutter/material.dart';
import 'package:miafona/modules/signUp/controllers/signUp_controller.dart';
//import 'package:miafona/constants/chargement.dart';
//import 'package:http/http.dart' as http;

class Formulaire extends StatefulWidget {
  Formulaire({Key? key}) : super(key: key);

  @override
  _FormulaireState createState() => _FormulaireState();
}

class _FormulaireState extends State<Formulaire> {

  final _formKey = GlobalKey<FormState>();
  //bool _chargement = false;
  String _name="";
  String _password="";
  Future? _futureUser;

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary : Colors.grey[300],
    shape: const RoundedRectangleBorder(
      borderRadius:BorderRadius.all(Radius.circular(2))
    )
  );

  FutureBuilder _buildFutureBuilder() {
    return FutureBuilder/*<User*/(
      future: _futureUser,
      builder: (context , snapshot) {
        if(snapshot.hasData) {
          return Text(snapshot.data!.name);
        }else if(snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }

  SingleChildScrollView _buildSingleChildScrollView() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 50.0 , horizontal: 30.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Nom",
                  border: OutlineInputBorder(),
                  hintText: "Ecrivez votre nom ici"
                ),
                validator: (value){
                  final RegExp nameExp = RegExp(r'^[A-Za-z0-9@.]+$');
                  if(value==null || value.isEmpty) return "Le champ nom est requis";
                  if(!nameExp.hasMatch(value)) return "Entrer des caractères alphabetiques";
                  return null;
                },
                onChanged: (String? value){
                  setState(() {
                    this._name = value!; 
                  }); 
                  print("Nom = $_name");
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Mot de passe",
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (String? value){
                  return (value!.isEmpty) ? "Entrer votre mot de passe" : null;
                },
                onChanged: (String? value){
                  this._password = value!;  
                  print("Password = $_password");
                },
              ),
              SizedBox(height: 10.0),
              
              ElevatedButton(
                style : raisedButtonStyle,
                onPressed: (){
                  if(_formKey.currentState!.validate()){
                    setState(() {
                      _futureUser = createUser(_name,_password);
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("nom"))
                    );
                  }
                }, 
                child: Text("S'inscrire"),
                // style: ButtonStyle(
                //   overlayColor: MaterialStateProperty.resolveWith<Color>(
                //     (Set<MaterialState> states) {
                //       if (states.contains(MaterialState.focused)) 
                //         return Colors.red;
                //       return Colors.black54;
                //     }
                //   ),
                // ),
              ),
            ],
          ),
        ),
      ),
    );

    
  }

  @override
  Widget build(BuildContext context) {
    // return _chargement ? Chargement() : Scaffold(
      return Scaffold(
      body: _futureUser == null ? _buildSingleChildScrollView() : _buildFutureBuilder()
    );
  }
}