import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'lab 4',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'lab 4'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _currentSliderValue = 0;
  //bool isButtonPress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:ListView(
        children: <Widget>[
          TextField(
            decoration: const InputDecoration(
              labelText: "set number",
              hintText: "please, enter a number",
            ),
            onChanged: (value) {
              print(value);
            },
          ),
          ButtonWithPress(),
          ButtonWithCounter(),
          const Date(),
          const Time(),
          DropdownButton<String>(
            value: "first",
            items: const [
              DropdownMenuItem(value: "first", child: Text("first")),
              DropdownMenuItem(value: "second", child: Text("second")),
              DropdownMenuItem(value: "third", child: Text("third")),
            ],
            onChanged: (selectedValue) {
              if (selectedValue is String){
                setState(() {
                  switch(selectedValue){
                    case "first": {
                      _currentSliderValue = 0;
                      break;
                    }
                    case "second": {
                      _currentSliderValue = 50;
                      break;
                    }
                    case "third": {
                      _currentSliderValue = 100;
                      break;
                    }
                  }
                });
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                'selectedValue: $selectedValue'),
                ));
              }
            },
          ),
          const Switch(),
          SliderEx(value: _currentSliderValue),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ButtonWithPress extends StatefulWidget{
  ButtonWithPress({super.key});

  @override
  State<ButtonWithPress> createState() => _ButtonWithPressState();
}

class _ButtonWithPressState extends State<ButtonWithPress>{
  bool isPress = false;
  Color buttonColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconButton(
          onPressed: () {
            setState(() {
              isPress = isPress ? false : true;
              buttonColor = isPress ? Colors.amber : Colors.green;
            });
          },
          icon: Icon(
              Icons.add_circle,
              color: buttonColor,
            )
          ),
        Text(
          isPress ? "Press" : "Not press"
        )
      ],
    );
  }
}

class ButtonWithCounter extends StatefulWidget{
  ButtonWithCounter({super.key});

  @override
  State<ButtonWithCounter> createState() => _ButtonWithCounterState();
}

class _ButtonWithCounterState extends State<ButtonWithCounter>{
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconButton(
            onPressed: () {
              setState(() {
                count++;
              });
            },
            icon: const Icon(
              Icons.add_circle,
              color: Colors.blue,
            )
        ),
        Text(
            "number of clicks: $count"
        )
      ],
    );
  }
}

class Date extends StatefulWidget {
  const Date({super.key, this.restorationId});

  final String? restorationId;

  @override
  State<Date> createState() => _DateState();
}

class _DateState extends State<Date> with RestorationMixin{
  final RestorableDateTime _selectedDate = RestorableDateTime(DateTime(2023, 4, 25));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
        onComplete: _selectDate,
        onPresent: (navigator, arguments) {
          return navigator.restorablePush(
            _datePickerRoute,
            arguments: _selectedDate.value.millisecondsSinceEpoch,
          );
        },
      );

  static Route<DateTime> _datePickerRoute(
      BuildContext context,
      Object? arguments,
      ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2023),
          lastDate: DateTime(2024),
        );
      },
    );
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        OutlinedButton(
            onPressed: () {
              _restorableDatePickerRouteFuture.present();
            },
            child: const Text('Select date'),
        )
      ]
    );
  }

  @override
  String? get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(_restorableDatePickerRouteFuture, 'date_picker_route_future');
  }
}

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
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Selected: ${_selectedTime.value.hour}:${_selectedTime.value.minute}'),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          OutlinedButton(
            onPressed: () {
              _restorableTimePickerRouteFuture.present();
            },
            child: const Text('Select Time'),
          )
        ]
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

class DropDown extends StatelessWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        value: "first",
        items: const [
          DropdownMenuItem(value: "first", child: Text("first")),
          DropdownMenuItem(value: "second", child: Text("second")),
          DropdownMenuItem(value: "third", child: Text("third")),
        ],
        onChanged: (selectedValue) {
          if (selectedValue is String){

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  'selectedValue: $selectedValue'),
            ));
          }
        },
    );
  }

}

class Switch extends StatefulWidget {
  const Switch({Key? key}) : super(key: key);

  @override
  State<Switch> createState() => _SwitchState();
}

class _SwitchState extends State<Switch> {
  bool _isCheck = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: SwitchListTile(
        title: Text(_isCheck ? "on" : "off"),
        value: _isCheck,
        onChanged: (value) {
          setState(() {
            _isCheck = _isCheck ? false : true;
          });
        },
      ),
    );
  }
}

class SliderEx extends StatefulWidget {
   SliderEx({Key? key, required this.value}) : super(key: key);

   double value;
  @override
  State<SliderEx> createState() => _SliderExState();
}

class _SliderExState extends State<SliderEx> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: widget.value,
          min: 0,
          max: 100,
          label: widget.value.round().toString(),
          onChanged: (double value) {
            setState(() {
              widget.value = value;
            });
          },
        ),
        Text(widget.value.round().toString()),
      ],
    );

  }
}









