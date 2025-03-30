import 'package:flutter/material.dart';

class OtpInput extends StatefulWidget {
  final int length;
  final Function(String) onCompleted;
  final Function(String)? onChanged;
  final TextStyle? textStyle;
  final double fieldWidth;
  final double fieldHeight;
  final InputDecoration? decoration;

  const OtpInput({
    super.key,
    this.length = 4,
    required this.onCompleted,
    this.onChanged,
    this.textStyle,
    this.fieldWidth = 60,
    this.fieldHeight = 60,
    this.decoration,
  });

  @override
  OtpInputState createState() => OtpInputState(); // Changed from _OtpInputState to OtpInputState
}

// Changed class name from _OtpInputState to OtpInputState (removed underscore)
class OtpInputState extends State<OtpInput> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      widget.length,
      (index) => TextEditingController(),
    );
    _focusNodes = List.generate(
      widget.length,
      (index) => FocusNode(),
    );
  }

  void clearFields() {
    for (var controller in _controllers) {
      controller.clear();
    }
    FocusScope.of(context).requestFocus(_focusNodes[0]);
    if (widget.onChanged != null) {
      widget.onChanged!('');
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _handleChange(String value, int index) {
    if (value.length == 1 && index < widget.length - 1) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    }
    if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }

    final currentCode = _controllers.map((c) => c.text).join();
    widget.onChanged?.call(currentCode);

    if (currentCode.length == widget.length) {
      widget.onCompleted(currentCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        widget.length,
        (index) => SizedBox(
          width: widget.fieldWidth,
          height: widget.fieldHeight,
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            style: widget.textStyle ?? Theme.of(context).textTheme.headlineSmall,
            decoration: widget.decoration ??
                InputDecoration(
                  counterText: '',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
            onChanged: (value) => _handleChange(value, index),
          ),
        ),
      ),
    );
  }
}