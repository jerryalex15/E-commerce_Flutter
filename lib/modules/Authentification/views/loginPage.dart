import 'package:flutter/material.dart';
import 'package:animator/animator.dart';
import 'package:miafona/modules/home/views/Home.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //variable
  bool _showPassword = false;
  final _formKey = GlobalKey<FormState>();
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    padding: EdgeInsets.all(32.0),
    textStyle: TextStyle(
      color: Colors.white,
    ),
    elevation: 0,
    primary:Colors.deepOrange,
    onSurface: Colors.deepOrange,
    shape: const RoundedRectangleBorder(
      borderRadius:BorderRadius.all(Radius.circular(0.0))
    )
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/husky.jpg'),
                        fit: BoxFit.fill, 
                      ),
                    ),
                    foregroundDecoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7)
                    ),
                  ),
                  if (MediaQuery.of(context).viewInsets == EdgeInsets.zero)
                    Padding(
                      padding: const EdgeInsets.only(top:kToolbarHeight),
                      child: Text(
                        "E-Antsena",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0, 
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  Animator<double>(
                    duration: Duration(microseconds: 10000),
                    triggerOnInit: true,
                    curve: Curves.easeIn,
                    tween: Tween<double>(begin: -1, end: 0),
                    builder: (context , state , child) {
                      return FractionalTranslation(
                        translation: Offset(state.value,0),
                        child: child,
                      );
                    },
                    child: Align(
                      alignment: Alignment.bottomCenter,
                        child: ListView(
                          physics:
                            MediaQuery.of(context).viewInsets == EdgeInsets.zero
                            ?NeverScrollableScrollPhysics()
                            :null,
                          padding: const EdgeInsets.all(32.0),
                          shrinkWrap: true,
                          children: [
                            const SizedBox(height: kToolbarHeight,),
                            Text(
                              'Bonjour',
                              style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height:10.0),
                            Text(
                              'Bienvenue sur notre magnifique app, nous sommes ravis de vous recevoir',
                              style: TextStyle(color: Colors.blueGrey , fontSize: 16.0),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height:20.0),
                            TextFormField(
                              cursorColor: Colors.white,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 16.0 , horizontal: 32.0),
                                suffixIcon: Icon(
                                  Icons.person,
                                  color: Colors.blueGrey,
                                ),
                                hintText: "Nom d'utilisateur",
                                hintStyle: TextStyle(color: Colors.blueGrey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40.0)
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.deepOrange),
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                              ),
                              validator:(value)=> value!.isEmpty ? "Veuillez entre votre nom" : null
                            ),
                            const SizedBox(height: 10.0,),
                            TextFormField(
                              cursorColor: Colors.white,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              obscureText: !this._showPassword,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 16.0 , horizontal: 32.0),
                                suffixIcon: IconButton(
                                  icon:Icon(
                                    Icons.remove_red_eye_rounded,
                                    color: Colors.blueGrey,
                                  ),
                                  onPressed: () {
                                    setState(()=>{
                                      this._showPassword = !this._showPassword  
                                    });
                                  },
                                ),
                                hintText: "Mot de passe",
                                hintStyle: TextStyle(color: Colors.blueGrey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40.0)
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.deepOrange),
                                  borderRadius: BorderRadius.circular(40.0),
                                ), 
                              ),
                              validator:(value)=> value!.isEmpty ? "Veuillez entre votre mot de passe" : null
                            ),
                            const SizedBox(height: 20.0,),
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  ),
                              ),
                              onPressed: (){}, 
                              child: Text("Créer un nouveau compte")
                            )
                          ],
                        )
                      )  
                    )
                ],
              ), 
            ),
            if (MediaQuery.of(context).viewInsets == EdgeInsets.zero )
              ElevatedButton(
                style: raisedButtonStyle,
                child: Text("Continuer".toUpperCase()),
                onPressed: (){
                  if(_formKey.currentState!.validate()){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('je suis un snackbar'))
                    );
                    Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) =>Home()));
                  }
                }, 
              )
          ]
        ),
      ),
    );
  }
}