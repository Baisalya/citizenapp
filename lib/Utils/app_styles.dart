import 'package:flutter/material.dart';

class AppStyles {
  static const TextStyle LoginPrimaryText = TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle LoginSecondaryText = TextStyle(
    fontSize: 16,

    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle primaryText = TextStyle(
    fontSize: 16,
    fontFamily: 'OpenSans',
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle secondaryText = TextStyle(
    fontSize: 16,
    fontFamily: 'OpenSans',
    color: Colors.grey,
  );

  static ButtonStyle get primaryButtonStyle => ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(12)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    ),
  );
}
