import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: _buildbody(context),
    );
  }

  _buildbody(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(50.0),
          child: Padding(
            padding: EdgeInsets.all(100.0),
            child: SpinKitFadingCircle(
              size: 100.0,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
