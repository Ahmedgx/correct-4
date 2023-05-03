import 'package:flutter/material.dart';

//App Bar

Widget appbar() => Row(
      children: [
        IconButton(
          onPressed: () {},
          color: Color(0xff125578),
          iconSize: 32,
          icon: Icon(
            Icons.arrow_back_outlined,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          'Correct',
          style: TextStyle(
            color: Color(0xff000000),
            fontWeight: FontWeight.w700,
            fontSize: 26,
            fontFamily: 'poppins',
          ),
        ),
        SizedBox(
          width: 5.0,
        ),
        Text(
          '4',
          style: TextStyle(
            color: Color(0xff61BDEE),
            fontWeight: FontWeight.w700,
            fontSize: 26,
            fontFamily: 'poppins',
          ),
        ),
      ],
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  String? Function(String?)? validator,
  bool isPassword = false,
  bool obscureText = false,
  bool isClickable = true,
  IconData? suffix,
  void Function()? suffixPressed,
  void Function()? onTap,
  void Function(String)? onSubmit,
  void Function(String)? onChanged,
}) =>
    TextFormField(
      onFieldSubmitted: onSubmit,
      onChanged: onChanged,
      onTap: onTap,
      validator: validator,
      obscureText: obscureText,
      enabled: isClickable,
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        labelText: label,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(suffix),
              )
            : null,
      ),
    );

Widget defaultButton({
  double width = double.infinity,
  double height = 44,
  Color background = Colors.blue,
  Color color = Colors.white,
  bool isUpperCase = false,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: background,
        border: Border.all(
          color: Color(0xff61BDEE),
        ),
      ),
      child: TextButton(
        onPressed: () {
          function();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: color,
            fontSize: 18,
            fontFamily: 'poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
