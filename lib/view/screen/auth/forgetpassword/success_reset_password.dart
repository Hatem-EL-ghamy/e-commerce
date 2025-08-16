import 'package:flutter/material.dart';

import '../../../widgets/sucsses_register_or_forgetpassword/sucsses_register_or_forgetpassword.dart';



class SuccessResetPasswordScreen extends StatelessWidget {
  const SuccessResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:AppBar(
       title: const Text("Success",style: TextStyle(fontSize: 24)),
     ),
      body:success(text: "Password has been reset \n successfully") ,
    );
  }
}

