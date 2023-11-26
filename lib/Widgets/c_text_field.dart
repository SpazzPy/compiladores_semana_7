// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

// Definimos la clase CTextFieldInput que es un StatefulWidget
class CTextFieldInput extends StatefulWidget {
  // Definimos un controlador de texto
  TextEditingController textController;
  // Definimos una función para manejar los cambios de texto
  final Function(String) handleTextChange;

  // Constructor de la clase
  CTextFieldInput({
    Key? key,
    required this.textController,
    required this.handleTextChange,
  }) : super(key: key);

  // Creamos el estado del widget
  @override
  CTextFieldInputState createState() => CTextFieldInputState();
}

// Definimos la clase CTextFieldInputState que es el estado de CTextFieldInput
class CTextFieldInputState extends State<CTextFieldInput> {
  // Definimos el método initState que se llama cuando se crea el estado
  @override
  void initState() {
    super.initState();
    // Llamamos a handleTextChange con el texto actual del controlador
    widget.handleTextChange(widget.textController.text);
  }

  // Definimos el método dispose que se llama cuando se destruye el estado
  @override
  void dispose() {
    // Liberamos los recursos del controlador de texto
    widget.textController.dispose();
    super.dispose();
  }

  // Definimos el método build que construye la interfaz de usuario
  @override
  Widget build(BuildContext context) {
    // Retornamos un SingleChildScrollView que contiene un TextField
    return SingleChildScrollView(
      child: TextField(
        // Asignamos el controlador de texto al TextField
        controller: widget.textController,
        // Permitimos un número ilimitado de líneas
        maxLines: null,
        // No definimos ninguna decoración para el TextField
        decoration: null,
        // Llamamos a handleTextChange cada vez que cambia el texto
        onChanged: widget.handleTextChange,
      ),
    );
  }
}

// Definimos la clase CTextFieldOutput que es un StatefulWidget
class CTextFieldOutput extends StatefulWidget {
  // Definimos un controlador de texto
  TextEditingController textController;

  // Constructor de la clase
  CTextFieldOutput({
    Key? key,
    required this.textController,
  }) : super(key: key);

  // Creamos el estado del widget
  @override
  CTextFieldOutputState createState() => CTextFieldOutputState();
}

// Definimos la clase CTextFieldOutputState que es el estado de CTextFieldOutput
class CTextFieldOutputState extends State<CTextFieldOutput> {
  // Definimos el método build que construye la interfaz de usuario
  @override
  Widget build(BuildContext context) {
    // Retornamos un SingleChildScrollView que contiene un TextField
    return SingleChildScrollView(
      child: TextField(
        // Asignamos el controlador de texto al TextField
        controller: widget.textController,
        // Permitimos un número ilimitado de líneas
        maxLines: null,
        // No definimos ninguna decoración para el TextField
        decoration: null,
        // Hacemos que el TextField sea de solo lectura
        readOnly: true,
      ),
    );
  }
}
