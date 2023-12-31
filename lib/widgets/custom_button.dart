import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.text,
      required this.onPressed,
        this.color= Colors.blue,
      this.width,
      this.height = 40})
      : super(key: key);
  final String text;
  // ignore: prefer_typing_uninitialized_variables
  final  onPressed;
  final double? width;
  final double? height;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextButton(
        style: const ButtonStyle(
          elevation: MaterialStatePropertyAll(5),
            padding: MaterialStatePropertyAll(EdgeInsets.all(0))),
        onPressed: onPressed,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: color,
                gradient:LinearGradient(
                  colors: [color, color.withAlpha(150)],
                ),
                borderRadius: BorderRadius.circular(5)),
            alignment: Alignment.center,
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}
