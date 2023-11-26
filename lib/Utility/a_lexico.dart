import 'package:flutter_compiladores_semana7/Utility/response.dart';
import 'package:flutter_compiladores_semana7/Utility/rules.dart';

// Definimos una función que realiza el análisis léxico
Map<String, dynamic> aLexico(String content) {
  // Inicializamos las variables de éxito, mensaje y valor del resultado
  bool success = true;
  String message = 'Exito';
  String resultValue = '';

  // Limpiamos y normalizamos el contenido
  content = content.trim().replaceAll(RegExp(r'\s{2,}'), ' ').toLowerCase();
  content = content.replaceAll(RegExp(r'\s*,\s*'), ',');

  // Definimos las reglas para las variables y los valores
  Map<String, RegExp> varRules = aLexicRulesVariables;
  Map<String, RegExp> valuesRules = aLexicRulesValues;

  // Inicializamos el resultado y las banderas de captura
  String result = '';
  bool captureVar = false;
  bool captureValues = false;

  // Iteramos sobre cada palabra en el contenido
  for (String cnt in content.split(' ')) {
    // Quitamos los espacios al principio y al final de la palabra
    cnt = cnt.trim();
    // Si la palabra está vacía, continuamos con la siguiente iteración
    if (cnt.isEmpty) continue;

    // Iteramos sobre cada clave en las reglas de las variables
    for (String key in varRules.keys) {
      // Si la regla coincide con la palabra
      if (varRules[key]!.hasMatch(cnt)) {
        // Añadimos la palabra al resultado con el prefijo "ID_"
        result += '$ID_ $cnt\n';
        // Activamos la bandera de captura de variables
        captureVar = true;
        // Salimos del bucle
        break;
      }
    }

    // Si no se capturó ninguna variable
    if (!captureVar) {
      // Iteramos sobre cada clave en las reglas de los valores
      for (String key in valuesRules.keys) {
        // Si la regla coincide con la palabra
        if (valuesRules[key]!.hasMatch(cnt)) {
          // Si la clave es "intergerID", añadimos la palabra al resultado con el prefijo "int_"
          if (key == intergerID) {
            result += '$int_ $cnt\n';
            // Si la clave es "pointID", añadimos la palabra al resultado con el prefijo "array_"
          } else if (key == pointID) {
            result += '$array_ $cnt\n';
          }
          // Activamos la bandera de captura de valores
          captureValues = true;
          // Salimos del bucle
          break;
        }

        // Si la palabra es un color válido
        if (svgColorNames.contains(cnt)) {
          // Añadimos la palabra al resultado con el prefijo "string_"
          result += '$string_ $cnt\n';
          // Activamos la bandera de captura de valores
          captureValues = true;
          // Salimos del bucle
          break;
        }
      }
    }

    // Si no se capturó ninguna variable ni valor
    if (!captureVar && !captureValues) {
      // Añadimos la palabra al resultado con el prefijo "error_"
      result += '$error_ $cnt\n';
      // Desactivamos la bandera de éxito
      success = false;
      // Establecemos el mensaje de error
      message = 'Error en: $cnt';
      // Vaciamos el valor del resultado
      resultValue = "";
      // Salimos del bucle
      break;
    }

    // Desactivamos las banderas de captura
    captureVar = false;
    captureValues = false;
  }

// Si el resultado no está vacío
  if (result.isNotEmpty) {
    // Añadimos "Tokens:" al principio del resultado
    result = 'Tokens:\n\n$result';
    // Establecemos el valor del resultado
    resultValue = result;
// Si el resultado está vacío
  } else {
    // Desactivamos la bandera de éxito
    success = false;
    // Establecemos el mensaje de error
    message = 'No se encontraron tokens';
    // Vaciamos el valor del resultado
    resultValue = "";
  }
  // Retornamos la respuesta
  return response(
    successful: success, // Indicamos si el análisis fue exitoso
    message: message, // Proporcionamos un mensaje
    value: resultValue, // Proporcionamos el valor del resultado
  );
}
