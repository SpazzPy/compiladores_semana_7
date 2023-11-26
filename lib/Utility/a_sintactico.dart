import 'package:flutter_compiladores_semana7/Utility/response.dart';
import 'package:flutter_compiladores_semana7/Utility/rules.dart';

// Definimos una función que realiza el análisis sintáctico
Map<String, dynamic> aSintactico(String content) {
  // Si el contenido está vacío
  if (content.isEmpty || content == '') {
    // Retornamos una respuesta con un mensaje de error
    return response(
      message: "No hay contenido",
    );
  }

  // Definimos varias variables
  int ignoreFirstLines = 3; // Número de líneas a ignorar al principio
  int count = 0; // Contador
  String temp = ''; // Cadena temporal
  List parameters = []; // Lista de parámetros
  List tempParameters = []; // Lista temporal de parámetros

  // Iteramos sobre cada línea en el contenido
  for (String cnt in content.split("\n")) {
    // Quitamos los espacios al principio y al final de la línea
    cnt = cnt.trim();
    // Incrementamos el contador
    count += 1;
    // Si el contador es menor que el número de líneas a ignorar, continuamos con la siguiente iteración
    if (count < ignoreFirstLines) continue;
    // Si la línea está vacía, continuamos con la siguiente iteración
    if (cnt.isEmpty) continue;

    // Dividimos la línea en palabras
    List<String> c = cnt.split(" ");
    // Si la línea tiene más de una palabra y la primera palabra no es "error"
    if (c.length > 1 && c[0] != error_) {
      // Continuamos abajo
    } else {
      // Si no, retornamos una respuesta con un mensaje de error
      return response(
        message: "Error en el analizador léxico",
      );
    }

    // Si la primera palabra es "ID"
    if (c[0] == ID_) {
      // Buscamos las variables
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
        // Si la cadena temporal está vacía, retornamos una respuesta con un mensaje de error
        return response(
          message: "Se debe iniciar con una variable.",
        );
      }
      // Buscamos los valores
      tempParameters.add(c[1]);
    }
  }

  // Si la cadena temporal no está vacía
  if (temp.isNotEmpty) {
    // Si la lista temporal de parámetros está vacía
    if (tempParameters.isEmpty) {
      // Añadimos la cadena temporal a la lista de parámetros
      parameters.add([temp]);
    } else {
      // Si no, añadimos la cadena temporal y la lista temporal de parámetros a la lista de parámetros
      parameters.add([temp, tempParameters]);
    }
    // Vaciamos la lista temporal de parámetros
    tempParameters = [];
  }

  // Si la lista de parámetros está vacía
  if (parameters.isEmpty) {
    // Retornamos una respuesta con un mensaje de error
    return response(
      message: "No hay contenido",
    );
  }

  // Ordenamos los valores en sus clases
  Map<String, dynamic> r = checkParameters(parameters);
  // Retornamos el resultado
  return r;
}

// Definimos una función que verifica los parámetros
Map<String, dynamic> checkParameters(List parameters) {
  // Creamos una respuesta inicial
  Map<String, dynamic> r = response(
    successful: true,
    message: "Exito",
    value: "",
    objects: [],
  );

  // Definimos un mapa de constructores de objetos
  Map<String, Function> objectBuilders = {
    paperID: (p, r) => buildObject(p, r, SVGPaper()),
    rectID: (p, r) => buildObject(p, r, SVGRect()),
    circleID: (p, r) => buildObject(p, r, SVGCircle()),
    lineID: (p, r) => buildObject(p, r, SVGLine()),
    ellipseID: (p, r) => buildObject(p, r, SVGEllipse()),
  };

  // Iteramos sobre cada elemento en los parámetros
  for (List element in parameters) {
    // Si el elemento no está vacío y el mapa de constructores de objetos contiene la clave del elemento
    if (element.isNotEmpty && objectBuilders.containsKey(element[0])) {
      // Construimos el objeto y actualizamos la respuesta
      r = objectBuilders[element[0]]!(element, r);
    }
  }
  // Retornamos la respuesta
  return r;
}

// Definimos una función que construye un objeto
dynamic buildObject(List p, Map<String, dynamic> resp, obj) {
  // Obtenemos el ID del objeto
  String varName = obj.getID();

  // Si la lista de parámetros tiene más de un elemento
  if (p.length > 1) {
    // Creamos un mensaje de error
    String errorMsg = "$varName ${p[1].join(' ')}";

    // Si el objeto espera menos valores que los proporcionados
    if (obj.expectedValues < p[1].length) {
      // Retornamos una respuesta con un mensaje de error
      return response(
        message: "Se espera al menos ${obj.expectedValues} valores en $errorMsg",
      );
    }

    // Iteramos sobre cada valor en los parámetros
    for (var i = 0; i < p[1].length; i++) {
      // Intentamos convertir el valor a un entero, o lo dejamos como está si no es posible
      var v = i < obj.expectedValues - 1 ? int.tryParse(p[1][i]) : p[1][i];
      // Definimos el tipo esperado del valor
      var expectedType = i < obj.expectedValues - 1 ? "int" : "color válido";

      // Si el valor es nulo, o no es un entero cuando se espera uno, o no es un color válido cuando se espera uno
      if (v == null || (i < obj.expectedValues - 1 && v is! int) || (i == obj.expectedValues - 1 && !svgColorNames.contains(v))) {
        // Retornamos una respuesta con un mensaje de error
        return response(
          message: "Se espera un $expectedType en el parametro ${i + 1} de $errorMsg",
        );
      }

      // Establecemos el valor en el objeto
      obj.setValues(i, v);
    }
  }

  // Creamos un mensaje con el ID del objeto y sus valores
  String valueMsg = "ID: $varName\n";
  Map values = obj.getValues();
  for (var element in values.keys) {
    valueMsg += "$element: ${values[element]}\n";
  }
  // Añadimos el mensaje al resultado en la respuesta
  resp[resultKey] += "$valueMsg\n";
  // Añadimos el objeto a la lista de objetos en la respuesta
  resp[objectKey].add(obj);

  // Retornamos la respuesta
  return resp;
}
