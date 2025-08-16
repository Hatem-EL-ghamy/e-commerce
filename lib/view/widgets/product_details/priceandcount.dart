import 'package:flutter/material.dart';

import '../../../shared/styles/colors.dart';

class PriceAndCountItems extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String price;
  final String count;
  const PriceAndCountItems(
      {Key? key,
        required this.onAdd,
        required this.onRemove,
        required this.price,
        required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FloatingActionButton(
heroTag: "remove",
          mini: true,
          elevation: 0,
          backgroundColor: AppColor.gray2,
          onPressed:onRemove,
          child: const Icon(
            Icons.remove,
            // size: 35,
            color: AppColor.gray,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10 ),
          child: Text(
            count,
            style: const TextStyle(fontSize: 24, height: 1.1),
          ),
        ),
        FloatingActionButton(
          heroTag: "add",
          mini: true,
          elevation: 0,
          backgroundColor: AppColor.gray2,
          onPressed:onAdd,
          child: const Icon(
            Icons.add,
            // size: 35,
            color: AppColor.gray,
          ),
        ),
        const Spacer(),
        Text(
          "$price \EGP",
          style: const TextStyle(
              color: AppColor.defaultColor, fontSize: 24, height: 1.1),
        )
      ],
    );
  }
}