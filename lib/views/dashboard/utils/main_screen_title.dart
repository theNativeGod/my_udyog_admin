import 'package:flutter/material.dart';

class MainScreenTitle extends StatelessWidget {
  const MainScreenTitle({
    required this.title,
    required this.subTitle,
    super.key,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: title,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Colors.grey.shade700,
            ),
        children: [
          TextSpan(
            text: subTitle,
            style: const TextStyle(
              color: Color(0xff1F4393),
            ),
          ),
        ],
      ),
    );
  }
}
