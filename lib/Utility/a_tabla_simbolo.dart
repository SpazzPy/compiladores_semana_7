import 'package:flutter/material.dart';
import 'package:flutter_compiladores_semana7/Utility/response.dart';
import 'package:flutter_compiladores_semana7/Widgets/c_text.dart';

// Definimos una función que crea una tabla de símbolos a partir de una lista de objetos
Map<String, dynamic> tablaSimbolo(List objs) {
  // Si la lista de objetos está vacía
  if (objs.isEmpty) {
    // Retornamos una respuesta con un mensaje de error
    return response(
      message: "No hay contenido",
    );
  }

  // Si la lista de objetos no está vacía
  // Retornamos una respuesta con un estado de éxito, un mensaje de éxito y una tabla construida a partir de los objetos
  return response(
    successful: true,
    message: "Exito",
    table: buildTable(objs),
  );
}

// Definimos una función que construye una tabla a partir de una lista de filas
Table buildTable(List rows) {
  // Creamos una lista vacía para las filas de la tabla
  List<TableRow> tableRows = [];

  // Añadimos la fila de encabezado por defecto
  tableRows.add(defaultHeaderRow());

  // Iteramos sobre cada objeto en las filas
  int count = 0;
  for (dynamic obj in rows) {
    // Iteramos sobre cada sub-objeto en las filas
    int subCount = 0;

    // Incrementamos el contador
    count += 1;
    List<Widget> tableCells = [];

    // Añadimos una nueva fila a la tabla
    tableRows.add(
      TableRow(
        children: [
          // Primera celda: el contador
          TableCell(
            child: Text(
              "$count",
              textAlign: TextAlign.center,
            ),
          ),
          // Segunda celda: el ID del objeto
          TableCell(
            child: Text(
              obj.getID().toString(),
              textAlign: TextAlign.center,
            ),
          ),
          // Tercera celda: el tipo del objeto
          TableCell(
            child: Text(
              obj.runtimeType.toString(),
              textAlign: TextAlign.center,
            ),
          ),
          // Cuarta celda: la palabra "class"
          const TableCell(
            child: Text(
              "class",
              textAlign: TextAlign.center,
            ),
          ),
          // Quinta celda: el ID del objeto
          TableCell(
            child: Text(
              obj.getID().toString(),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );

    // Obtenemos los valores del objeto en un mapa
    Map<String, dynamic> ob = obj.getValues();

    // Iteramos sobre cada clave en el mapa
    for (String key in ob.keys) {
      // Incrementamos el contador secundario
      subCount += 1;

      // Añadimos una nueva fila a la tabla
      tableRows.add(
        TableRow(
          children: [
            // Primera celda: el contador principal y secundario
            TableCell(
              child: Text(
                "$count.$subCount",
                textAlign: TextAlign.center,
              ),
            ),
            // Segunda celda: la clave del valor
            TableCell(
              child: Text(
                key.toString(),
                textAlign: TextAlign.center,
              ),
            ),
            // Tercera celda: el valor
            TableCell(
              child: Text(
                ob[key].toString(),
                textAlign: TextAlign.center,
              ),
            ),
            // Cuarta celda: el tipo del valor
            TableCell(
              child: Text(
                ob[key].runtimeType.toString(),
                textAlign: TextAlign.center,
              ),
            ),
            // Quinta celda: el ID del objeto
            TableCell(
              child: Text(
                obj.getID().toString(),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
    }
  }

  // Retornamos una tabla
  return Table(
    // Con bordes en todas las celdas
    border: TableBorder.all(),
    // Definimos el ancho de las columnas
    columnWidths: const <int, TableColumnWidth>{
      0: FlexColumnWidth(2), // Ancho flexible de la quinta columna
      1: FlexColumnWidth(3), // Ancho flexible de la quinta columna
      2: FlexColumnWidth(3), // Ancho flexible de la quinta columna
      3: FlexColumnWidth(3), // Ancho flexible de la quinta columna
      4: FlexColumnWidth(3), // Ancho flexible de la quinta columna
    },
    // Alineamos verticalmente todas las celdas en el medio
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    // Añadimos las filas a la tabla
    children: tableRows,
  );
}

// Definimos una función que retorna la fila de encabezado por defecto
TableRow defaultHeaderRow() {
  // Retornamos una TableRow constante
  return const TableRow(
    // Con una lista de TableCell como hijos
    children: [
      // Primera celda: "Pos"
      TableCell(
        child: Text(
          "Pos",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // Segunda celda: "Name"
      TableCell(
        child: Text(
          "Name",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // Tercera celda: "Value"
      TableCell(
        child: Text(
          "Value",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // Cuarta celda: "Type"
      TableCell(
        child: Text(
          "Type",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // Quinta celda: "Scope"
      TableCell(
        child: Text(
          "Scope",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
