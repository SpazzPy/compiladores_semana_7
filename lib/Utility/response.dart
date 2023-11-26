import 'package:flutter/material.dart';

// Definimos varias cadenas que representan diferentes claves para la respuesta
String successKey = "success"; // clave para el estado de éxito
String errorKey = "error"; // clave para el mensaje de error
String resultKey = "results"; // clave para el valor de resultado
String objectKey = "object"; // clave para los objetos
String tableKey = "table"; // clave para la tabla

// Definimos una función que genera una respuesta
Map<String, dynamic> response({
  bool successful = false, // estado de éxito, por defecto es falso
  String message = "", // mensaje de error, por defecto es una cadena vacía
  String value = "", // valor de resultado, por defecto es una cadena vacía
  List? objects, // lista de objetos, por defecto es nulo
  Table? table, // tabla, por defecto es nulo
}) {
  // Retornamos un mapa con la respuesta
  return {
    successKey: successful, // estado de éxito
    errorKey: message, // mensaje de error
    resultKey: value, // valor de resultado
    objectKey: objects ?? [], // lista de objetos, si es nulo, usamos una lista vacía
    tableKey: table ?? Table(), // tabla, si es nulo, usamos una tabla vacía
  };
}
