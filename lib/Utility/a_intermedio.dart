import 'package:flutter_compiladores_semana7/Utility/response.dart';

// Definimos una función que genera código intermedio
Map<String, dynamic> codigoIntermedio(List objs) {
  // Si la lista de objetos está vacía
  if (objs.isEmpty) {
    // Retornamos una respuesta con un mensaje de error
    return response(
      message: "No hay contenido",
    );
  }

  // Inicializamos el resultado
  String r = "";
  // Iteramos sobre cada objeto en la lista
  for (var obj in objs) {
    // Si el ID del objeto es "paper"
    if (obj.getID() == "paper") {
      // Generamos el SVG del objeto y lo asignamos al resultado
      r = obj.generateSVG();
      // Si el resultado no está vacío
    } else if (r.isNotEmpty) {
      // Generamos el SVG del objeto y lo añadimos al resultado
      r += obj.generateSVG();
    }
  }
  // Si el resultado no está vacío
  if (r.isNotEmpty) {
    // Añadimos el cierre de la etiqueta SVG al resultado
    r += "</svg>";
    // Si el resultado está vacío
  } else {
    // Retornamos una respuesta con un mensaje de error
    return response(
      message: "Se debe iniciar con 'paper'",
    );
  }

  // Retornamos una respuesta con el resultado
  return response(
    successful: true,
    message: "Exito",
    value: r,
  );
}
