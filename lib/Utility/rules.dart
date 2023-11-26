abstract class SVGObject {
  Map<String, dynamic> values = {};
  int expectedValues;

  SVGObject(this.expectedValues);

  void setValues(int index, dynamic value) {
    values[values.keys.elementAt(index)] = value;
  }

  Map<String, dynamic> getValues() {
    return values;
  }

  String getID();
}

class SVGPaper extends SVGObject {
  SVGPaper() : super(3) {
    values = {
      'width': 100,
      'height': 100,
      'color': "black",
    };
  }

  @override
  String getID() {
    return paperID;
  }

  String generateSVG() {
    return '''
      <svg width='${values['width']}' height='${values['height']}'>
      <rect width='${values['width']}' height='${values['height']}' style='fill:${values['color']}'/>
      ''';
  }
}

class SVGRect extends SVGObject {
  SVGRect() : super(5) {
    values = {
      'x': 0,
      'y': 0,
      'width': 10,
      'height': 10,
      'color': "black",
    };
  }

  @override
  String getID() {
    return rectID;
  }

  String generateSVG() {
    return '''
      <rect x='${values['x']}' y='${values['y']}' width='${values['width']}' height='${values['height']}' style='fill:${values['color']}'/>
      ''';
  }
}

class SVGCircle extends SVGObject {
  SVGCircle() : super(4) {
    values = {
      'x': 0,
      'y': 0,
      'r': 10,
      'color': "black",
    };
  }

  @override
  String getID() {
    return circleID;
  }

  String generateSVG() {
    return '''
      <circle  cx='${values['x']}' cy='${values['y']}' r='${values['r']}' style='fill:${values['color']}'/>
      ''';
  }
}

class SVGLine extends SVGObject {
  SVGLine() : super(6) {
    values = {
      'x1': 0,
      'y1': 0,
      'x2': 10,
      'y2': 10,
      'stroke-width': 1,
      'color': "white",
    };
  }

  @override
  String getID() {
    return lineID;
  }

  String generateSVG() {
    return '''
      <line  x1='${values['x1']}' y1='${values['y1']}' x2='${values['x2']}' y2='${values['y2']}' style='stroke:${values['color']};stroke-width:${values['stroke-width']}'/>
      ''';
  }
}

class SVGEllipse extends SVGObject {
  SVGEllipse() : super(5) {
    values = {
      'x': 0,
      'y': 0,
      'rx': 10,
      'ry': 10,
      'color': "black",
    };
  }

  @override
  String getID() {
    return ellipseID;
  }

  String generateSVG() {
    return '''
      <ellipse   cx='${values['x']}' cy='${values['y']}' rx='${values['rx']}' ry='${values['ry']}' fill='${values['color']}'/>
      ''';
  }
}

String ID_ = "Identificador:";
String string_ = "String:";
String int_ = "Int:";
String array_ = "Array:";
String error_ = "Error:";

String paperID = "paper";
String circleID = "circle";
String rectID = "rect";
String lineID = "line";
String ellipseID = "ellipse";

List<String> ids = [paperID, circleID, rectID, lineID, ellipseID];
Map<String, RegExp> aLexicRulesVariables = {
  for (var id in ids) id: RegExp('^$id\$'),
};

String intergerID = "integer";
String pointID = "point";

Map<String, RegExp> aLexicRulesValues = {
  intergerID: RegExp(r'^[0-9]+$'),
  pointID: RegExp(r'^[0-9]+,[0-9]+$'),
};

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
