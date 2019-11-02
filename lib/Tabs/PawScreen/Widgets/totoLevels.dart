import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// The class that builds a bar indicating the level of food/water.
/// The widget comprises of AnimatedContainer inside of a container, where the 
/// container acts as a rounded border while the animated container is what
/// changes based on the food level. Currently there is a bug where if the level
/// is too low, then the animated container inside the widget will spread outside
/// the parent container. Same when the level is too high
class TotoLevel extends StatelessWidget {
  // Properties of level Indicator
  final double barHeight;
  final double barWidth;
  final Color barColor;
  final double barLevel;
  final Color borderColor;

  // Constructor
  TotoLevel (
    this.barHeight, 
    this.barWidth, 
    this.barColor, 
    this.barLevel,
    this.borderColor
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: barHeight,
      width: barWidth,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 3.0,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        )
      ),
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            // This value should be equal to the container parent
            // Radius.circular value - border.width value
            bottomLeft: Radius.circular(27.0),
            bottomRight: Radius.circular(27.0),
          ),
          border: Border.all(
            color: barColor,
          ),
          color: barColor,
        ),
        width: barWidth,
        height: barLevel,
        curve: Curves.fastOutSlowIn,
        duration: Duration(seconds: 1),
      ),
    );
  }
}