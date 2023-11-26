import 'package:flutter_compiladores_semana7/Utility/response.dart';
import 'package:flutter_compiladores_semana7/Utility/rules.dart';

Map<String, dynamic> aSintactico(String content) {
  if (content.isEmpty || content == '') {
    return response(
      message: "No hay contenido",
    );
  }

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
      if (temp.isNotEmpty) {
        if (tempParameters.isEmpty) {
          parameters.add([temp]);
        } else {
          parameters.add([temp, tempParameters]);
        }
        tempParameters = [];
      }

      temp = c[1];
    } else if ([int_, array_, string_].contains(c[0])) {
      if (temp.isEmpty) {
        return response(
          message: "Se debe iniciar con una variable.",
        );
      }
      //Find the values
      tempParameters.add(c[1]);
    }
  }
  if (temp.isNotEmpty) {
    if (tempParameters.isEmpty) {
      parameters.add([temp]);
    } else {
      parameters.add([temp, tempParameters]);
    }
    tempParameters = [];
  }

  if (parameters.isEmpty) {
    return response(
      message: "No hay contenido",
    );
  }

  // Order the values in their classes
  Map<String, dynamic> r = checkParameters(parameters);
  return r;
}

Map<String, dynamic> checkParameters(List parameters) {
  Map<String, dynamic> r = response(
    successful: true,
    message: "Exito",
    value: "",
    objects: [],
  );

  Map<String, Function> objectBuilders = {
    paperID: (p, r) => buildObject(p, r, SVGPaper()),
    rectID: (p, r) => buildObject(p, r, SVGRect()),
    circleID: (p, r) => buildObject(p, r, SVGCircle()),
    lineID: (p, r) => buildObject(p, r, SVGLine()),
    ellipseID: (p, r) => buildObject(p, r, SVGEllipse()),
  };

  for (List element in parameters) {
    if (element.isNotEmpty && objectBuilders.containsKey(element[0])) {
      r = objectBuilders[element[0]]!(element, r);
    }
  }
  return r;
}

dynamic buildObject(List p, Map<String, dynamic> resp, obj) {
  String varName = obj.getID();
  if (p.length > 1) {
    String errorMsg = "$varName ${p[1].join(' ')}";

    if (obj.expectedValues < p[1].length) {
      return response(
        message: "Se espera al menos ${obj.expectedValues} valores en $errorMsg",
      );
    }

    for (var i = 0; i < p[1].length; i++) {
      var v = i < obj.expectedValues - 1 ? int.tryParse(p[1][i]) : p[1][i];
      var expectedType = i < obj.expectedValues - 1 ? "int" : "color válido";

      if (v == null || (i < obj.expectedValues - 1 && v is! int) || (i == obj.expectedValues - 1 && !svgColorNames.contains(v))) {
        return response(
          message: "Se espera un $expectedType en el parametro ${i + 1} de $errorMsg",
        );
      }

      obj.setValues(i, v);
    }
  }

  String valueMsg = "ID: $varName\n";
  Map values = obj.getValues();
  for (var element in values.keys) {
    valueMsg += "$element: ${values[element]}\n";
  }
  resp[resultKey] += "$valueMsg\n";
  resp[objectKey].add(obj);

  return resp;
}
