import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  late Stopwatch stopwatch;
  late Timer t;
  void handleStartStop() {
    if (stopwatch.isRunning)
      stopwatch.stop();
    else
      stopwatch.start();
  }

  String returnFormattedText() {
    var milli = stopwatch.elapsed.inMilliseconds;
    String milliseconds = (milli % 1000).toString().padLeft(3, "0");
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, "0");
    String minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(2, "0");
    // String milliseconds =
    return "$minutes:$seconds:$milliseconds";
  }

  @override
  void initState() {
    // TODO: implement initState
    stopwatch = Stopwatch();
    super.initState();

    t = Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  onPressed: () {
                    handleStartStop();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 250,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blue, width: 10)),
                    child: Text(
                      returnFormattedText(),
                      style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70),
                    ),
                  ),
                ),
                CupertinoButton(
                  onPressed: () {
                    stopwatch.reset();
                    stopwatch.stop();
                  },
                  padding: const EdgeInsets.all(0),
                  child: const Text(
                    "Reset",
                    style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
