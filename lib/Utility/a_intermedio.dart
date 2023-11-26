import 'package:flutter_compiladores_semana7/Utility/response.dart';

Map<String, dynamic> codigoIntermedio(List objs) {
  if (objs.isEmpty) {
    return response(
      message: "No hay contenido",
    );
  }

  String r = "";
  for (var obj in objs) {
    if (obj.getID() == "paper") {
      r = obj.generateSVG();
    } else if (r.isNotEmpty) {
      r += obj.generateSVG();
    }
  }
  if (r.isNotEmpty) {
    r += "</svg>";
  }

  return response(
    successful: true,
    message: "Exito",
    value: r,
  );
}
