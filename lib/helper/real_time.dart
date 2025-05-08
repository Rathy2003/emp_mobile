import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RealTimeClock extends StatelessWidget {
  // Stream that emits formatted time every second
  Stream<String> get timeStream async* {
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      final now = DateTime.now();
      yield DateFormat('h:mm:ss a').format(now); // e.g. 7:38:54 PM
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: timeStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            snapshot.data!,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.white),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
