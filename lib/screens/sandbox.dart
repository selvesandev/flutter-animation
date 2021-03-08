import 'package:flutter/material.dart';

class SandBox extends StatefulWidget {
  SandBox({Key key}) : super(key: key);

  @override
  _SandBoxState createState() => _SandBoxState();
}

class _SandBoxState extends State<SandBox> {
  double _opacity = 1;
  double _margin = 0;
  double _width = 200;
  Color _color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(_margin),
        width: _width,
        color: _color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("Animate Mmargin"),
              onPressed: () {
                setState(() {
                  _margin = 50;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
