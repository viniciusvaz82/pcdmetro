import 'package:flutter/material.dart';

class CustomColors {
  Color _activePrimaryColor = Color.fromARGB(255, 63, 81, 181);
  Color _activeSecondaryColor = Color.fromARGB(255, 230, 230, 255);
  Color gradientMainColor = Color.fromARGB(255, 0, 75, 200);
  Color gradientSecColor = Color.fromARGB(255, 75, 175, 255);

  Color getActivatePrimaryColor() {
    return _activePrimaryColor;
  }

  Color getActiveSecondaryColor() {
    return _activeSecondaryColor;
  }

  Color getGradientMainColor() {
    return gradientMainColor;
  }

  Color getGradientSecColor() {
    return gradientSecColor;
  }
}
