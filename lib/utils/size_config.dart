import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static double screenWidth =0;
  static double screenHeight =0;
  static double _blockSizeHorizontal = 0;
  static double _blockSizeVertical = 0;

  static double textMultiplier =0;
  static double imageSizeMultiplier =0;
  static double heightMultiplier =0;
  static double widthMultiplier =0;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      screenHeight = constraints.maxHeight;
      screenWidth = constraints.maxWidth;
    } else if(orientation == Orientation.landscape) {
      screenHeight = constraints.maxWidth;
      screenWidth = constraints.maxHeight;
    }
    _blockSizeHorizontal = screenWidth / 100;
    _blockSizeVertical = screenHeight / 100;

    textMultiplier = _blockSizeVertical;
    imageSizeMultiplier = _blockSizeHorizontal;
    heightMultiplier = _blockSizeVertical;
    widthMultiplier = _blockSizeHorizontal;
    

    print('Block Size Horizontal --> $_blockSizeHorizontal');
    print('Block Size Vertical --> $_blockSizeVertical');

  }
}
