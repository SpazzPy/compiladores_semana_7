import 'package:flutter_compiladores_semana7/Utility/default_classes.dart';
import 'package:flutter_compiladores_semana7/Utility/response.dart';
import 'package:flutter_compiladores_semana7/Utility/rules.dart';

Map<String, dynamic> aLexico(String content) {
  bool success = true;
  String message = 'Exito';
  String resultValue = '';

  content = content.trim().replaceAll(RegExp(r'\s{2,}'), ' ').toLowerCase();
  content = content.replaceAll(RegExp(r'\s*,\s*'), ',');
  Map<String, RegExp> varRules = aLexicRulesVariables;
  Map<String, RegExp> valuesRules = aLexicRulesValues;

  String result = '';
  bool captureVar = false;
  bool captureValues = false;

  for (String cnt in content.split(' ')) {
    cnt = cnt.trim();
    if (cnt.isEmpty) continue;
    for (String key in varRules.keys) {
      if (varRules[key]!.hasMatch(cnt)) {
        result += '$ID_ $cnt\n';
        captureVar = true;
        break;
      }
    }
    if (!captureVar) {
      for (String key in valuesRules.keys) {
        if (valuesRules[key]!.hasMatch(cnt)) {
          if (key == intergerID) {
            result += '$int_ $cnt\n';
          } else if (key == pointID) {
            result += '$array_ $cnt\n';
          }
          captureValues = true;
          break;
        }
      }
    }

    if (!captureVar && !captureValues) {
      result += '$error_ $cnt\n';
      success = false;
      message = 'Error en: $cnt';
      resultValue = "";
      break;
    }

    captureVar = false;
    captureValues = false;
  }

  if (result.isNotEmpty) {
    result = 'Tokens:\n\n$result';
    resultValue = result;
  } else {
    success = false;
    message = 'No se encontraron tokens';
    resultValue = "";
  }

  return response(
    successful: success,
    message: message,
    value: resultValue,
  );
}
