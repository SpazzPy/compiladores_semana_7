// Definimos una clase abstracta SVGObject
abstract class SVGObject {
  // Definimos un mapa para almacenar los valores de las propiedades del objeto
  Map<String, dynamic> values = {};
  // Definimos un entero para almacenar el número de valores esperados
  int expectedValues;

  // Constructor de la clase
  SVGObject(this.expectedValues);

  // Método para establecer los valores de las propiedades del objeto
  void setValues(int index, dynamic value) {
    values[values.keys.elementAt(index)] = value;
  }

  // Método para obtener los valores de las propiedades del objeto
  Map<String, dynamic> getValues() {
    return values;
  }

  // Método abstracto para obtener el ID del objeto
  String getID();
}

// Definimos una clase SVGPaper que extiende SVGObject
class SVGPaper extends SVGObject {
  // Constructor de la clase
  SVGPaper() : super(3) {
    values = {
      'width': 100,
      'height': 100,
      'color': "black",
    };
  }

  // Sobreescribimos el método getID
  @override
  String getID() {
    return paperID;
  }

  // Método para generar el código SVG
  String generateSVG() {
    return '''
      <svg width='${values['width']}' height='${values['height']}'>
      <rect width='${values['width']}' height='${values['height']}' style='fill:${values['color']}'/>
      ''';
  }
}

// Definimos una clase SVGRect que extiende SVGObject
class SVGRect extends SVGObject {
  // Constructor de la clase
  SVGRect() : super(5) {
    values = {
      'x': 0, // Posición en el eje x
      'y': 0, // Posición en el eje y
      'width': 10, // Ancho del rectángulo
      'height': 10, // Altura del rectángulo
      'color': "black", // Color del rectángulo
    };
  }

  // Sobreescribimos el método getID
  @override
  String getID() {
    return rectID;
  }

  // Método para generar el código SVG
  String generateSVG() {
    return '''
      <rect x='${values['x']}' y='${values['y']}' width='${values['width']}' height='${values['height']}' style='fill:${values['color']}'/>
      ''';
  }
}

// Definimos una clase SVGCircle que extiende SVGObject
class SVGCircle extends SVGObject {
  // Constructor de la clase
  SVGCircle() : super(4) {
    values = {
      'x': 0, // Posición en el eje x
      'y': 0, // Posición en el eje y
      'r': 10, // Radio del círculo
      'color': "black", // Color del círculo
    };
  }

  // Sobreescribimos el método getID
  @override
  String getID() {
    return circleID;
  }

  // Método para generar el código SVG
  String generateSVG() {
    return '''
      <circle  cx='${values['x']}' cy='${values['y']}' r='${values['r']}' style='fill:${values['color']}'/>
      ''';
  }
}

// Definimos una clase SVGLine que extiende SVGObject
class SVGLine extends SVGObject {
  // Constructor de la clase
  SVGLine() : super(6) {
    values = {
      'x1': 0, // Posición inicial en el eje x
      'y1': 0, // Posición inicial en el eje y
      'x2': 10, // Posición final en el eje x
      'y2': 10, // Posición final en el eje y
      'stroke-width': 1, // Ancho de la línea
      'color': "white", // Color de la línea
    };
  }

  // Sobreescribimos el método getID
  @override
  String getID() {
    return lineID;
  }

  // Método para generar el código SVG
  String generateSVG() {
    return '''
      <line  x1='${values['x1']}' y1='${values['y1']}' x2='${values['x2']}' y2='${values['y2']}' style='stroke:${values['color']};stroke-width:${values['stroke-width']}'/>
      ''';
  }
}

// Definimos una clase SVGEllipse que extiende SVGObject
class SVGEllipse extends SVGObject {
  // Constructor de la clase
  SVGEllipse() : super(5) {
    values = {
      'x': 0, // Posición en el eje x
      'y': 0, // Posición en el eje y
      'rx': 10, // Radio en el eje x
      'ry': 10, // Radio en el eje y
      'color': "black", // Color de la elipse
    };
  }

  // Sobreescribimos el método getID
  @override
  String getID() {
    return ellipseID;
  }

  // Método para generar el código SVG
  String generateSVG() {
    return '''
      <ellipse   cx='${values['x']}' cy='${values['y']}' rx='${values['rx']}' ry='${values['ry']}' fill='${values['color']}'/>
      ''';
  }
}

// Definimos varias cadenas que representan diferentes tipos de identificadores
String ID_ = "Identificador:";
String string_ = "String:";
String int_ = "Int:";
String array_ = "Array:";
String error_ = "Error:";

// Definimos los identificadores para diferentes tipos de objetos SVG
String paperID = "paper";
String circleID = "circle";
String rectID = "rect";
String lineID = "line";
String ellipseID = "ellipse";

// Creamos una lista con todos los identificadores
List<String> ids = [paperID, circleID, rectID, lineID, ellipseID];

// Creamos un mapa de reglas léxicas para los identificadores
// Cada identificador se asocia con una expresión regular que coincide exactamente con el identificador
Map<String, RegExp> aLexicRulesVariables = {
  for (var id in ids) id: RegExp('^$id\$'),
};

// Definimos los identificadores para diferentes tipos de valores
String intergerID = "integer";
String pointID = "point";

// Creamos un mapa de reglas léxicas para los valores
// Cada identificador se asocia con una expresión regular que coincide con el tipo de valor correspondiente
Map<String, RegExp> aLexicRulesValues = {
  intergerID: RegExp(r'^[0-9]+$'), // Los enteros son una secuencia de dígitos
  pointID: RegExp(r'^[0-9]+,[0-9]+$'), // Los puntos son dos enteros separados por una coma
};

// Definimos una lista de nombres de colores SVG
List<String> svgColorNames = [
  'black',
  'silver',
  'gray',
  'white',
  'maroon',
  'red',
  'purple',
  'fuchsia',
  'green',
  'lime',
  'olive',
  'yellow',
  'navy',
  'blue',
  'teal',
  'aqua',
  'aliceblue',
  'antiquewhite',
  'aqua',
  'aquamarine',
  'azure',
  'beige',
  'bisque',
  'blanchedalmond',
  'blueviolet',
  'brown',
  'burlywood',
  'cadetblue',
  'chartreuse',
  'chocolate',
  'coral',
  'cornflowerblue',
  'cornsilk',
  'crimson',
  'cyan',
  'darkblue',
  'darkcyan',
  'darkgoldenrod',
  'darkgray',
  'darkgreen',
  'darkgrey',
  'darkkhaki',
  'darkmagenta',
  'darkolivegreen',
  'darkorange',
  'darkorchid',
  'darkred',
  'darksalmon',
  'darkseagreen',
  'darkslateblue',
  'darkslategray',
  'darkslategrey',
  'darkturquoise',
  'darkviolet',
  'deeppink',
  'deepskyblue',
  'dimgray',
  'dimgrey',
  'dodgerblue',
  'firebrick',
  'floralwhite',
  'forestgreen',
  'gainsboro',
  'ghostwhite',
  'gold',
  'goldenrod',
  'greenyellow',
  'grey',
  'honeydew',
  'hotpink',
  'indianred',
  'indigo',
  'ivory',
  'khaki',
  'lavender',
  'lavenderblush',
  'lawngreen',
  'lemonchiffon',
  'lightblue',
  'lightcoral',
  'lightcyan',
  'lightgoldenrodyellow',
  'lightgray',
  'lightgreen',
  'lightgrey',
  'lightpink',
  'lightsalmon',
  'lightseagreen',
  'lightskyblue',
  'lightslategray',
  'lightslategrey',
  'lightsteelblue',
  'lightyellow',
  'limegreen',
  'linen',
  'magenta',
  'mediumaquamarine',
  'mediumblue',
  'mediumorchid',
  'mediumpurple',
  'mediumseagreen',
  'mediumslateblue',
  'mediumspringgreen',
  'mediumturquoise',
  'mediumvioletred',
  'midnightblue',
  'mintcream',
  'mistyrose',
  'moccasin',
  'navajowhite',
  'oldlace',
  'olivedrab',
  'orange',
  'orangered',
  'orchid',
  'palegoldenrod',
  'palegreen',
  'paleturquoise',
  'palevioletred',
  'papayawhip',
  'peachpuff',
  'peru',
  'pink',
  'plum',
  'powderblue',
  'rosybrown',
  'royalblue',
  'saddlebrown',
  'salmon',
  'sandybrown',
  'seagreen',
  'seashell',
  'sienna',
  'skyblue',
  'slateblue',
  'slategray',
  'slategrey',
  'snow',
  'springgreen',
  'steelblue',
  'tan',
  'thistle',
  'tomato',
  'turquoise',
  'violet',
  'wheat',
  'whitesmoke',
  'yellowgreen'
];
