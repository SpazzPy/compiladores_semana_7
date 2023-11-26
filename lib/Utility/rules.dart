class SVGPaper {
  int width;
  int height;
  String color;
  int expectedValues = 3;

  SVGPaper({
    this.width = 100,
    this.height = 100,
    this.color = "black",
  });

  String setValues(List<dynamic> values) {
    String msg = "Error en:";
    if (values.length > 0) {
      int? v = int.tryParse(values[0]);
      if (v != null) {
        width = v;
      } else {
        return "$msg $v";
      }
    }
    if (values.length > 1) {
      int? v = int.tryParse(values[1]);
      if (v != null) {
        height = v;
      } else {
        return "$msg $v";
      }
    }
    if (values.length > 2) {
      String v = values[2];
      if (svgColorNames.contains(v)) {
        color = v;
      } else {
        return "$msg $v";
      }
    }
    return "";
  }
}

class SVGPen {
  final String color;

  SVGPen(
    this.color,
  );
}

class SVGExpectedValues {
  String? name;
  int? x;
  int? y;
  int? x1;
  int? y1;
  int? x2;
  int? y2;
  List<int>? points;
  int? width;
  int? height;
  String? color;
  int expectedValues = 3;
  Map<String, dynamic> map = {};

  SVGExpectedValues(
    this.name,
    this.x,
    this.y,
    this.x1,
    this.y1,
    this.x2,
    this.y2,
    this.points,
    this.width,
    this.height,
    this.color,
  ) {
    if (name != null) map['name'] = name;
    if (x != null) map['x'] = x;
    if (y != null) map['y'] = y;
    if (x1 != null) map['x1'] = x1;
    if (y1 != null) map['y1'] = y1;
    if (x2 != null) map['x2'] = x2;
    if (y2 != null) map['y2'] = y2;
    if (points != null) map['points'] = points;
    if (width != null) map['width'] = width;
    if (height != null) map['height'] = height;
    if (color != null) map['color'] = color;
  }

  List<String> getKeys() {
    return map.keys.toList();
  }
}

String ID_ = "Identificador:";
String int_ = "Int:";
String array_ = "Array:";
String error_ = "Error:";

String paperID = "paper";
String penID = "pen";
String circleID = "circle";
String rectID = "rect";
String lineID = "line";
String intergerID = "integer";
String pointID = "point";

Map<String, RegExp> aLexicRulesVariables = {
  paperID: RegExp(r'^paper$'),
  penID: RegExp(r'^pen$'),
  circleID: RegExp(r'^circle$'),
  rectID: RegExp(r'^rect$'),
  lineID: RegExp(r'^line$'),
};

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
