import 'package:flutter/material.dart';

void pushReplacment(Widget nextPage, BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => nextPage),
  );
}

void pushTo(Widget nextPage, BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => nextPage));
}

void pop(BuildContext context) {
  Navigator.pop(context);
}

void pushAndClearStack(Widget nextPage, BuildContext context) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => nextPage),
    (route) => false,
  );
}
