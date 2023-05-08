import 'package:flutter/material.dart';
import 'package:lab_7/menu.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';


class App4 extends StatefulWidget {
  App4({Key? key}) : super(key: key);

  @override
  State<App4> createState() => _App4State();
}

class _App4State extends State<App4> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();  // Need to call dispose function.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Menu(),
      body: SingleChildScrollView(
        child:
        Column(
          children: [
          StreamBuilder<int>(
          stream: _stopWatchTimer.rawTime,
            initialData: 0,
            builder: (context, snap) {
              final value = snap.data;
              final displayTime = StopWatchTimer.getDisplayTime(value!);
              return Column(
                children: <Widget>[
                  Text(
                    displayTime,
                    style: const TextStyle(
                        fontSize: 40,
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Row(
                      children: [
                        TextButton(
                            onPressed: () => _stopWatchTimer.onStartTimer(),
                            child: const Text("start")
                        ),
                        TextButton(
                            onPressed: () => _stopWatchTimer.onStopTimer(),
                            child: const Text("stop")
                        ),
                        TextButton(
                            onPressed: () => _stopWatchTimer.onResetTimer(),
                            child: const Text("reset")
                        )
                      ],
                    )
                  )
                ],
              );
            },
          ),
          ],
        )
      ),
    );
  }
}


