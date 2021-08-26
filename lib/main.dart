import 'package:flutter/material.dart';

void main(){
    runApp(new MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return new MaterialApp(
            title: "Widgets basiques",
            theme: new ThemeData(
                primarySwatch: Colors.blueGrey,
            ),
            debugShowCheckedModeBanner: false,
            home: new Home()
        );
    }
}

class Home extends StatefulWidget {
  
    @override
    State<StatefulWidget> createState() {
        return new _Home();
    }
}

class _Home extends State<Home>{

    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
                leading : new Icon(Icons.account_circle_outlined),
                title: new Text("titre"),
                actions: <Widget>[
                    new Icon(Icons.ac_unit_outlined),
                    new IconButton(
                        onPressed:()=>{
                        },
                    icon: new Icon(Icons.access_alarm_outlined))
                ],
                elevation: 10.0
            ),
            body: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                    Expanded(
                        child: Container(
                            color: Colors.blueGrey,
                            child: Text("data"),
                        )
                    ),
                    SizedBox(height: 20.0,),
                    Expanded(
                        flex: 2,
                        child: Container(
                            color: Colors.blue,
                            child: Text("data1"),
                        )
                    ),
                    SizedBox(height: 20.0,),
                    Expanded(
                        flex: 3,
                        child: Container(
                            color: Colors.amber,
                            child: Text("data2"),
                        )
                    ),
                    SizedBox(height: 20.0,),
                    Expanded(
                        flex: 2,
                        child: Container(
                            color: Colors.blue,
                            child: Text("data1"),
                        )
                    ),
                    SizedBox(height: 20.0,),
                    Expanded(
                        flex: 4,
                        child: Container(
                            color: Colors.blue,
                            child: Text("data1"),
                        )
                    )
                ],
            ),
        );
    }
}