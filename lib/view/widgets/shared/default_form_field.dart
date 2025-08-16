import 'package:flutter/material.dart';
import 'package:store_app_advanced/shared/styles/colors.dart';

Widget defaultFormField({
  required TextEditingController? controller,
  @required TextInputType? type,
  Function(String)? onSubmit,
  Function(String)? onChange,
  Function()? onTap,
  Function()? suffixPressed,
  bool isPassword = false,
  required String? Function(String?)? validate,
  @required String? label,
  @required String? hint,
  @required IconData? prefix,
  IconData? suffix,
  double radius=10,


  // bool isClickable = true,

}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      // enabled: isClickable,


      decoration: InputDecoration(
        labelText: label,
        hintText: hint,

        border:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        focusedBorder:  OutlineInputBorder(
          borderSide: const BorderSide(
              color:AppColor.defaultColor,
          ),

          borderRadius: BorderRadius.circular(radius),


        ),



        prefixIcon: Icon(
          prefix,
        ),




        suffixIcon: suffix != null ? IconButton(
          icon: Icon(
            suffix,
          ),
          onPressed: suffixPressed,
        ) : null,


      ),
    );