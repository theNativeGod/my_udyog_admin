import 'package:flutter/material.dart';

class ExportButton extends StatelessWidget {
  const ExportButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xff1F4393),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20,
                child: Image.asset('assets/images/export.png'),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Export',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: const Color(0xff1F4393),
                    ),
              ),
            ]),
      ),
    );
  }
}
