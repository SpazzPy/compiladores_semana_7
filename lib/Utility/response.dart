import 'package:flutter/material.dart';

String successKey = "success";
String errorKey = "error";
String resultKey = "results";
String objectKey = "object";
String tableKey = "table";

Map<String, dynamic> response({
  bool successful = false,
  String message = "",
  String value = "",
  List? objects,
  Table? table,
}) {
  return {
    successKey: successful,
    errorKey: message,
    resultKey: value,
    objectKey: objects ?? [],
    tableKey: table ?? Table(),
  };
}
