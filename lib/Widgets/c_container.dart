import 'package:flutter/material.dart';
import 'package:flutter_compiladores_semana7/Utility/default_classes.dart';
import 'package:flutter_compiladores_semana7/Widgets/c_text.dart';

class BasicContainer extends StatelessWidget {
  final Widget child;
  final int flexValue;
  final Color containerColor;
  final Color borderColor;
  final double borderWidth;
  final String title;
  final bool includeStatus;
  final DefaultClasses thisClass;

  BasicContainer({
    Key? key,
    this.child = const SizedBox(),
    this.flexValue = 1,
    this.containerColor = Colors.white,
    this.borderColor = Colors.grey,
    this.borderWidth = 2.0,
    this.title = "Default Title",
    this.includeStatus = true,
    DefaultClasses? thisClass,
  })  : thisClass = thisClass ?? DefaultClasses(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flexValue,
      child: Container(
        decoration: BoxDecoration(
          color: containerColor,
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(8.0, 3.0, 8.0, 3.0),
              child: boldText(
                message: title,
              ),
            ),
            includeStatus
                ? Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(8.0, 3.0, 8.0, 3.0),
                    color: thisClass.status ? const Color.fromARGB(200, 46, 125, 50) : const Color.fromARGB(214, 180, 20, 20),
                    child: boldText(
                      textColor: Colors.white,
                      message: thisClass.statusMessage,
                    ),
                  )
                : const SizedBox(),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(8.0, 3.0, 8.0, 3.0),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
