import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.controller, required this.label, this.maxLines});

  final TextEditingController controller;
  final String label;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 15.sp,
          ),
        ),
        SizedBox(height: 5.h),
        TextFormField(
          validator: (value) => value!.isEmpty || value.trim().isEmpty ? 'Enter $label' : null,
          maxLines: maxLines,
          controller: controller,
          cursorColor: AppColors.orange,
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.orange, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),),
        SizedBox(height: 10.h),
      ],
    );
  }
}
