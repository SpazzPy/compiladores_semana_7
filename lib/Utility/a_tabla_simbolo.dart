import 'package:flutter/material.dart';
import 'package:flutter_compiladores_semana7/Utility/response.dart';
import 'package:flutter_compiladores_semana7/Widgets/c_text.dart';

Map<String, dynamic> tablaSimbolo(List objs) {
  if (objs.isEmpty) {
    return response(
      message: "No hay contenido",
    );
  }

  return response(
    successful: true,
    message: "Exito",
    table: buildTable(objs),
  );
}

Table buildTable(List rows) {
  List<TableRow> tableRows = [];
  tableRows.add(defaultHeaderRow());
  int count = 0;
  for (dynamic obj in rows) {
    int subCount = 0;
    count += 1;
    List<Widget> tableCells = [];

    tableRows.add(
      TableRow(
        children: [
          TableCell(
            child: Text(
              "$count",
              textAlign: TextAlign.center,
            ),
          ),
          TableCell(
            child: Text(
              obj.getID().toString(),
              textAlign: TextAlign.center,
            ),
          ),
          TableCell(
            child: Text(
              obj.runtimeType.toString(),
              textAlign: TextAlign.center,
            ),
          ),
          const TableCell(
            child: Text(
              "class",
              textAlign: TextAlign.center,
            ),
          ),
          TableCell(
            child: Text(
              obj.getID().toString(),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );

    Map<String, dynamic> ob = obj.getValues();
    for (String key in ob.keys) {
      subCount += 1;
      tableRows.add(
        TableRow(
          children: [
            TableCell(
              child: Text(
                "$count.$subCount",
                textAlign: TextAlign.center,
              ),
            ),
            TableCell(
              child: Text(
                key.toString(),
                textAlign: TextAlign.center,
              ),
            ),
            TableCell(
              child: Text(
                ob[key].toString(),
                textAlign: TextAlign.center,
              ),
            ),
            TableCell(
              child: Text(
                ob[key].runtimeType.toString(),
                textAlign: TextAlign.center,
              ),
            ),
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

  return Table(
    border: TableBorder.all(),
    columnWidths: const <int, TableColumnWidth>{
      0: FlexColumnWidth(2),
      1: FlexColumnWidth(3),
      2: FlexColumnWidth(3),
      3: FlexColumnWidth(3),
      4: FlexColumnWidth(3),
    },
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: tableRows,
  );
}

TableRow defaultHeaderRow() {
  return const TableRow(
    children: [
      TableCell(
        child: Text(
          "Pos",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      TableCell(
        child: Text(
          "Name",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      TableCell(
        child: Text(
          "Value",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      TableCell(
        child: Text(
          "Type",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
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
