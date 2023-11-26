import 'package:flutter_compiladores_semana7/Utility/response.dart';
import 'package:flutter_compiladores_semana7/Utility/rules.dart';

Map<String, dynamic> aSintactico(String content) {
  if (content.isEmpty || content == '') {
    return response(
      successful: false,
      message: "No hay contenido",
    );
  }

  String result = "";
  int ignoreFirstLines = 3;
  int count = 0;
  String temp = '';
  List parameters = [];
  List tempParameters = [];

  for (String cnt in content.split("\n")) {
    cnt = cnt.trim();
    count += 1;
    if (count < ignoreFirstLines) continue;
    if (cnt.isEmpty) continue;

    List<String> c = cnt.split(" ");
    if (c.length > 1 && c[0] != error_) {
      // continue below
    } else {
      return response(
        message: "Error en el analizador léxico",
      );
    }

    if (c[0] == ID_) {
      // Find the variables
      String p = tempParameters.join(' ');
      if (temp.isNotEmpty) {
        if (p.isEmpty) {
          parameters.add("$temp");
        } else {
          parameters.add("$temp $p");
        }
        tempParameters = [];
      }

      temp = c[1];
    } else if ([int_, array_].contains(c[0])) {
      if (temp.isEmpty) {
        return response(
          message: "Se debe iniciar con una variable.",
        );
      }
      //Find the values
      tempParameters.add(c[1]);
    }
  }
  String p = tempParameters.join(' ');
  if (temp.isNotEmpty) {
    if (p.isEmpty) {
      parameters.add("$temp");
    } else {
      parameters.add("$temp $p");
    }
    tempParameters = [];
  }

  // Order the values in their classes
  bool successValue = true;
  String message = '';
  String resulValue = '';

  if (result.isNotEmpty) {
    resulValue = result;
  } else {
    successValue = false;
    message = 'Vacio';
    resulValue = '';
  }
  print(parameters);
  return response(
    successful: true,
    message: "message",
    value: resulValue,
  );
}
