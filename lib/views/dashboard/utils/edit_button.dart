import 'package:flutter/material.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color(0xffE6ECFA),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(4),
      child: Image.asset('assets/images/edit.png'),
    );
  }
}
