// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CTextFieldInput extends StatefulWidget {
  TextEditingController textController;
  final Function(String) handleTextChange;

  CTextFieldInput({
    Key? key,
    required this.textController,
    required this.handleTextChange,
  }) : super(key: key);

  @override
  CTextFieldInputState createState() => CTextFieldInputState();
}

class CTextFieldInputState extends State<CTextFieldInput> {
  @override
  void initState() {
    super.initState();
    widget.handleTextChange(widget.textController.text);
  }

  @override
  void dispose() {
    widget.textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: TextField(
        controller: widget.textController,
        maxLines: null,
        decoration: null,
        onChanged: widget.handleTextChange,
      ),
    );
  }
}

class CTextFieldOutput extends StatefulWidget {
  TextEditingController textController;

  CTextFieldOutput({
    Key? key,
    required this.textController,
  }) : super(key: key);

  @override
  CTextFieldOutputState createState() => CTextFieldOutputState();
}

class CTextFieldOutputState extends State<CTextFieldOutput> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: TextField(
        controller: widget.textController,
        maxLines: null,
        decoration: null,
        readOnly: true,
      ),
    );
  }
}
