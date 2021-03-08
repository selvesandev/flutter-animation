import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> _colorAnimation;
  bool isFav = false;
  Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(milliseconds: 500), vsync: this);

    _colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.red).animate(_controller);

    // _controller.forward();
    _controller.addListener(() {
      print(_controller.value);
      print(_colorAnimation.value);
      setState(() {});
    });
    _controller.addStatusListener((status) {
      print(status);
      if (status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          isFav = false;
        });
      }
    });
    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(tween: Tween<double>(end: 50, begin: 30), weight: 50),
      TweenSequenceItem<double>(tween: Tween<double>(end: 30, begin: 50), weight: 50),
    ]).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, _) {
        return IconButton(
          icon: Icon(
            Icons.favorite,
            color: _colorAnimation.value,
            size: _sizeAnimation.value,
          ),
          onPressed: () {
            if (isFav) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
        );
      },
    );
  }
}
