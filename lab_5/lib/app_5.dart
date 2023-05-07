import 'package:flutter/material.dart';
import 'package:lab_5/menu.dart';

class Time extends StatefulWidget {
  const Time({super.key, this.restorationId});

  final String? restorationId;

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> with RestorationMixin{
  final RestorableTimeOfDay _selectedTime = RestorableTimeOfDay(TimeOfDay.now());
  late final RestorableRouteFuture<TimeOfDay?> _restorableTimePickerRouteFuture =
  RestorableRouteFuture<TimeOfDay?>(
    onComplete: _selectTime,
    onPresent: (navigator, arguments) {
      return navigator.restorablePush(
        _TimePickerRoute,
        arguments: "",
      );
    },
  );

  static Route<TimeOfDay> _TimePickerRoute(
      BuildContext context,
      Object? arguments,
      ) {
    return DialogRoute<TimeOfDay>(
      context: context,
      builder: (BuildContext context) {
        return TimePickerDialog(
          restorationId: 'time_picker_dialog',
          initialTime: TimeOfDay.now(),
        );
      },
    );
  }

  void _selectTime(TimeOfDay? newSelectedTime) {
    if (newSelectedTime != null) {
      setState(() {
        _selectedTime.value = newSelectedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Menu(),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              OutlinedButton(
                onPressed: () {
                  _restorableTimePickerRouteFuture.present();
                },
                child: const Text('Select date'),
              ),
              Text( 'Selected: ${_selectedTime.value.hour}:${_selectedTime.value.minute}')
            ]
        ),
      ),
    );
  }

  @override
  String? get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedTime, 'selected_time');
    registerForRestoration(_restorableTimePickerRouteFuture, 'time_picker_route_future');
  }
}