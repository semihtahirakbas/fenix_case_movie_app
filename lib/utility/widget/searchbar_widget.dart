import 'package:fenix_case_movie_app/utility/theme/app_color.dart';
import 'package:flutter/material.dart';

class SearchbarWidget extends StatelessWidget {
  const SearchbarWidget({required this.controller, super.key});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColor.appTextColor,
      controller: controller,
      decoration: const InputDecoration(prefixIcon: Icon(Icons.search)),
    );
  }
}
