import 'package:flutter/material.dart';
typedef void RatingChangeCallback(double rating);

class CheckboxProgress extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;

  CheckboxProgress({this.starCount = 5, this.rating = .0, this.onRatingChanged, this.color});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.radio_button_unchecked,
        color: Colors.blue,
        size: 17.0,
      );
    }
    else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.radio_button_checked,
        color: Colors.blue,
        size: 17.0,
      );
    } else {
      icon = new Icon(
        Icons.check_circle,
        color: Colors.blue,
        size: 17.0,
      );
    }
    return new InkResponse(
      //onTap: onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(children: new List.generate(starCount, (index) => buildStar(context, index)));
  }
}