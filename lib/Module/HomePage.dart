import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_compiladores_semana7/Utility/a_intermedio.dart';
import 'package:flutter_compiladores_semana7/Utility/a_lexico.dart';
import 'package:flutter_compiladores_semana7/Utility/a_sintactico.dart';
import 'package:flutter_compiladores_semana7/Utility/a_tabla_simbolo.dart';
import 'package:flutter_compiladores_semana7/Utility/default_classes.dart';
import 'package:flutter_compiladores_semana7/Utility/response.dart';
import 'package:flutter_compiladores_semana7/Widgets/c_container.dart';
import 'package:flutter_compiladores_semana7/Widgets/c_text_field.dart';

// Definimos la clase Home que es un StatefulWidget
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomePage createState() => HomePage();
}

// Definimos la clase HomePage que es el estado de Home
class HomePage extends State<Home> {
  // Creamos instancias de DefaultClasses para cada etapa del compilador
  DefaultClasses defaultText = createDefaultClasses();
  DefaultClasses lexic = createDefaultClasses();
  DefaultClasses parsing = createDefaultClasses();
  DefaultClasses symbolTable = createDefaultClasses();
  DefaultClasses intermediateCode = createDefaultClasses();

  // Definimos el número máximo de líneas para el texto por defecto
  int maxLines = 26;
  // Inicializamos el estado
  @override
  void initState() {
    // Establecemos el texto por defecto
    defaultText.controller.text = '\n' * maxLines;
    super.initState();
  }

  // Definimos el método build que construye la interfaz de usuario
  @override
  Widget build(BuildContext context) {
    // Definimos la lógica del compilador
    void compiler_logic(String content) {
      // Eliminamos los espacios en blanco y las nuevas líneas del contenido
      content = content.trim().replaceAll('\n', ' ');

      // Actualizamos el estado después de que se haya completado el frame
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          // Realizamos el análisis léxico
          Map<String, dynamic> lexicResult = aLexico(content);
          lexic.status = lexicResult[successKey];
          lexic.statusMessage = lexicResult[errorKey];
          lexic.controller.text = lexicResult[resultKey];

          // Realizamos el análisis sintáctico
          Map<String, dynamic> parsingResult = aSintactico(lexicResult[resultKey]);
          parsing.status = parsingResult[successKey];
          parsing.statusMessage = parsingResult[errorKey];
          parsing.controller.text = parsingResult[resultKey];
          parsing.objects = parsingResult[objectKey];

          // Actualizamos la tabla de símbolos
          symbolTable.objects = parsingResult[objectKey];
          Map<String, dynamic> symbolTableResult = tablaSimbolo(parsingResult[objectKey]);
          symbolTable.status = symbolTableResult[successKey];
          symbolTable.statusMessage = symbolTableResult[errorKey];
          symbolTable.controller.text = symbolTableResult[resultKey];
          symbolTable.table = symbolTableResult[tableKey];

          // Generamos el código intermedio
          Map<String, dynamic> codigoIntermedioResult = codigoIntermedio(parsingResult[objectKey]);
          intermediateCode.status = codigoIntermedioResult[successKey];
          intermediateCode.statusMessage = codigoIntermedioResult[errorKey];
          intermediateCode.controller.text = codigoIntermedioResult[resultKey];
        });
      });
    }

    // Definimos una función para manejar cuando el texto está vacío
    void handleTextEmptiness(String value) {
      String content = value;
      List<String> lines = value.split('\n');

      // Si el número de líneas es menor que el máximo permitido
      if (lines.length < maxLines) {
        // Actualizamos el estado después de que se haya completado el frame
        WidgetsBinding.instance.addPostFrameCallback((_) {
          setState(() {
            // Añadimos nuevas líneas al texto hasta llegar al máximo permitido
            defaultText.controller.text = value + '\n' * (maxLines - lines.length);
          });
        });
      }
      // Ejecutamos la lógica del compilador
      compiler_logic(content);
    }

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "Autor: Frannie Hilario Fermin Rodriguez\nMatrícula: 1-16-0408",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          // Top Row
          Expanded(
            flex: 2,
            child: Row(
              children: [
                // Contenedor para el código fuente
                BasicContainer(
                  flexValue: 2,
                  title: "Código Fuente",
                  includeStatus: false,
                  child: CTextFieldInput(
                    textController: defaultText.controller,
                    handleTextChange: handleTextEmptiness,
                  ),
                ),
                // Contenedor para el visualizador SVG
                BasicContainer(
                  flexValue: 1,
                  title: "Visualizador",
                  includeStatus: false,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: intermediateCode.controller.text.isNotEmpty
                          ? SvgPicture.string(
                              intermediateCode.controller.text,
                            )
                          : const Text(""),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom Row
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Contenedor para el analizador léxico
                BasicContainer(
                  title: "Analizador Léxico",
                  thisClass: lexic,
                  child: CTextFieldOutput(
                    textController: lexic.controller,
                  ),
                ),
                // Contenedor para el analizador sintáctico
                BasicContainer(
                  title: "Analizador Sintáctico",
                  thisClass: parsing,
                  child: CTextFieldOutput(
                    textController: parsing.controller,
                  ),
                ),
                // Contenedor para la tabla de símbolos
                BasicContainer(
                  title: "Tabla de Símbolos",
                  thisClass: symbolTable,
                  child: SingleChildScrollView(
                    child: symbolTable.table,
                  ),
                ),
                BasicContainer(
                  title: "Generador de Código Intermedio",
                  thisClass: intermediateCode,
                  child: CTextFieldOutput(
                    textController: intermediateCode.controller,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
