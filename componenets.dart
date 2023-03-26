import 'package:flutter/material.dart';
import 'constants.dart';
class MyButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  Color color;
   MyButton({Key? key,required this.title,required this.onPress,this.color= Colors.grey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 70,
            decoration: BoxDecoration(
                color: color,
              shape: BoxShape.circle
            ),
            child: Center(child: Text(title,style: headingText,)),

          ),
        ),
      ),
    );
  }
}
