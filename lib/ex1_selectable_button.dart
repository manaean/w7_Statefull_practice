// EX 1 – The selectable button (handout page: EX 1). Start code from the handout.

import 'package:flutter/material.dart';

enum ButtonStatus { selected, notSelected }

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: Center(
          child: CustomButton(),
        ),
      ),
    ));

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  ButtonStatus _status = ButtonStatus.notSelected;

  String get textLabel =>
      _status == ButtonStatus.selected ? "Selected" : "Not selected";

  Color get textColor =>
      _status == ButtonStatus.selected ? Colors.white : Colors.black;

  Color get backgroundColors =>
      _status == ButtonStatus.selected ? Colors.blue[500]! : Colors.blue[50]!;

  void _toggleSelection() {
    setState(() {
      _status = _status == ButtonStatus.selected
          ? ButtonStatus.notSelected
          : ButtonStatus.selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
          onPressed: _toggleSelection,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColors,
          ),
          child: Center(
            child: Text(textLabel, style: TextStyle(color: textColor)),
          )),
    );
  }
}
