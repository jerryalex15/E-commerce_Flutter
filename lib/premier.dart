import 'package:flutter/material.dart';

class PremierPage extends StatefulWidget {
    PremierPage({Key? key}) : super(key: key);

     @override
     _PremierPageState createState() => _PremierPageState();
}

class _PremierPageState extends State<PremierPage> {
    @override
    Widget build(BuildContext context) {
        return Container(
            child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                    Image.asset("images/phonewallpaper.jpg"),
                    Container(
                        color: Colors.black12,
                        child: Text(
                            "Bienvenue",
                                style: TextStyle(
                                color: Colors.white10
                            ),
                        )
                    )
                ]
            ),
        );
    }
}