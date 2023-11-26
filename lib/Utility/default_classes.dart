import 'package:flutter/material.dart';

// Definimos una función que crea una instancia de DefaultClasses
DefaultClasses createDefaultClasses() {
  return DefaultClasses(
    statusMessage: "Mensaje de estado por defecto",
    status: false,
    controller: TextEditingController(),
  );
}

// Definimos una clase DefaultClasses
class DefaultClasses {
  String statusMessage; // Mensaje de estado
  bool status; // Estado
  TextEditingController controller; // Controlador de texto
  List objects = []; // Lista de objetos
  Table table = Table(); // Tabla

  // Constructor de la clase
  DefaultClasses({
    this.statusMessage = "Mensaje de éxito por defecto",
    this.status = false,
    TextEditingController? controller,
  }) : controller = controller ?? TextEditingController();
}
