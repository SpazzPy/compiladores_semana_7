import 'package:flutter/material.dart';
import 'package:flutter_compiladores_semana7/Utility/a_lexico.dart';
import 'package:flutter_compiladores_semana7/Utility/a_sintactico.dart';
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
          // parsing.controller.text = parsingResult;
          // symbolTable.controller.text = symbolTableResult;
          // intermediateCode.controller.text = intermediateCodeResult;
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
                  title: "Analizador Léxico",
                  child: CTextFieldOutput(
                    textController: lexic.controller,
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
                  child: CTextFieldOutput(
                    textController: symbolTable.controller,
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
