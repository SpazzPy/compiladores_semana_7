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

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<Home> {
  DefaultClasses defaultText = createDefaultClasses();
  DefaultClasses lexic = createDefaultClasses();
  DefaultClasses parsing = createDefaultClasses();
  DefaultClasses symbolTable = createDefaultClasses();
  DefaultClasses intermediateCode = createDefaultClasses();

  int maxLines = 26;
  @override
  void initState() {
    defaultText.controller.text = '\n' * maxLines;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void compiler_logic(String content) {
      content = content.trim().replaceAll('\n', ' ');

      // String symbolTableResult = tablaSimbolos(content);
      // String intermediateCodeResult = codigoIntermedio(content);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          Map<String, dynamic> lexicResult = aLexico(content);
          lexic.status = lexicResult[successKey];
          lexic.statusMessage = lexicResult[errorKey];
          lexic.controller.text = lexicResult[resultKey];
          Map<String, dynamic> parsingResult = aSintactico(lexicResult[resultKey]);
          parsing.status = parsingResult[successKey];
          parsing.statusMessage = parsingResult[errorKey];
          parsing.controller.text = parsingResult[resultKey];
          parsing.objects = parsingResult[objectKey];

          symbolTable.objects = parsingResult[objectKey];
          Map<String, dynamic> symbolTableResult = tablaSimbolo(parsingResult[objectKey]);
          symbolTable.status = symbolTableResult[successKey];
          symbolTable.statusMessage = symbolTableResult[errorKey];
          symbolTable.controller.text = symbolTableResult[resultKey];
          symbolTable.table = symbolTableResult[tableKey];

          Map<String, dynamic> codigoIntermedioResult = codigoIntermedio(parsingResult[objectKey]);
          intermediateCode.status = codigoIntermedioResult[successKey];
          intermediateCode.statusMessage = codigoIntermedioResult[errorKey];
          intermediateCode.controller.text = codigoIntermedioResult[resultKey];
        });
      });
    }

    void handleTextEmptiness(String value) {
      String content = value;
      List<String> lines = value.split('\n');
      if (lines.length < maxLines) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          setState(() {
            defaultText.controller.text = value + '\n' * (maxLines - lines.length);
          });
        });
      }
      compiler_logic(content);
    }

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Top Row
          Expanded(
            flex: 2,
            child: Row(
              children: [
                BasicContainer(
                  flexValue: 2,
                  title: "Código Fuente",
                  includeStatus: false,
                  child: CTextFieldInput(
                    textController: defaultText.controller,
                    handleTextChange: handleTextEmptiness,
                  ),
                ),
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
                BasicContainer(
                  title: "Analizador Léxico",
                  thisClass: lexic,
                  child: CTextFieldOutput(
                    textController: lexic.controller,
                  ),
                ),
                BasicContainer(
                  title: "Analizador Sintáctico",
                  thisClass: parsing,
                  child: CTextFieldOutput(
                    textController: parsing.controller,
                  ),
                ),
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
