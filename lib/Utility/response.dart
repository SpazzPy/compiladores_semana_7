String successKey = "success";
String errorKey = "error";
String resultKey = "results";

Map<String, dynamic> response({
  bool successful = false,
  String message = "",
  String value = "",
}) {
  return {
    successKey: successful,
    errorKey: message,
    resultKey: value,
  };
}
