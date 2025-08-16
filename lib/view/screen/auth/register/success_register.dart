import 'package:flutter/material.dart';

import '../../../widgets/sucsses_register_or_forgetpassword/sucsses_register_or_forgetpassword.dart';


class SuccessRegisterScreen extends StatelessWidget {
  const SuccessRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:AppBar(
       title: const Text("Success",style: TextStyle(fontSize: 24)),
     ),
      body:success(text: "Registration done successfully \n and activity email") ,
    );
  }
}
