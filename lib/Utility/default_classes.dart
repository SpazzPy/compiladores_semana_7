import 'package:flutter/material.dart';

DefaultClasses createDefaultClasses() {
  return DefaultClasses(
    statusMessage: "Default Status Message",
    status: false,
    controller: TextEditingController(),
  );
}

class DefaultClasses {
  String statusMessage;
  bool status;
  TextEditingController controller;
  List objects = [];
  Table table = Table();

  DefaultClasses({
    this.statusMessage = "Default Success Message",
    this.status = false,
    TextEditingController? controller,
  }) : controller = controller ?? TextEditingController();
}
