import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {
  SwitchWidget({
    super.key,
    required this.isOn,
  });
  bool isOn;
  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: .45,
      child: Switch(
        onChanged: (value) {
          widget.isOn = value;
          setState(() {});
        },
        value: widget.isOn,
        materialTapTargetSize: MaterialTapTargetSize.padded,
      ),
    );
  }
}
