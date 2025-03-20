import 'package:flutter/material.dart';

class ParameterBox extends StatefulWidget {
  final double height;
  final double width;
  final Icon icon;
  final String parameterValue;
  const ParameterBox({
    super.key,
    required this.height,
    required this.width,
    required this.icon,
    required this.parameterValue,
  });

  @override
  State<ParameterBox> createState() => _ParameterBoxState();
}

class _ParameterBoxState extends State<ParameterBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [widget.icon, Text(widget.parameterValue)],
      ),
    );
  }
}
