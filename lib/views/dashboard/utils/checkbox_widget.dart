import 'package:flutter/material.dart';
import 'package:my_udyog_admin/view_models/categories_provider.dart';
import 'package:provider/provider.dart';

import '../../../models/export.dart';

class CheckBoxWidget extends StatefulWidget {
  CheckBoxWidget({
   
    this.onTap,
    this.value,
    super.key,
  });
  
  var onTap;
  var value;
  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: .8,
      child: Checkbox(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0),
        ),
        side: MaterialStateBorderSide.resolveWith(
          (states) => BorderSide(
            width: 1.5,
            color: Colors.grey.shade400,
          ),
        ),
        activeColor: const Color(0xff1F4393),
        onChanged: widget.onTap,
        value: widget.value,
      ),
    );
  }
}
