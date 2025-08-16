import 'package:flutter/material.dart';

class TopAppbarCart extends StatelessWidget {
  final String title ;
  const TopAppbarCart({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Row(
          children: [
            Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      }, icon: const Icon(Icons.arrow_back)),
                )),
            Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 24),
                  ),
                )),
            const Spacer()
          ],
        )) ;
  }
}