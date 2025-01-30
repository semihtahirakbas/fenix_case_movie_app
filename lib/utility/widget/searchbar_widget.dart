import 'package:fenix_case_movie_app/utility/theme/app_color.dart';
import 'package:flutter/material.dart';

class SearchbarWidget extends StatefulWidget {
  const SearchbarWidget(
      {required this.controller, required this.onSearch, super.key});
  final TextEditingController controller;
  final Function(String value) onSearch;

  @override
  State<SearchbarWidget> createState() => _SearchbarWidgetState();
}

class _SearchbarWidgetState extends State<SearchbarWidget> {
  bool canClear = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      cursorColor: AppColor.appTextColor,
      controller: widget.controller,
      onFieldSubmitted: (value) {
        if (value.isEmpty) {
          return;
        }
        widget.onSearch.call(value);
      },
      onChanged: (value) {
        if (value.length >= 2) {
          widget.onSearch.call(value);
        }
        setState(() {
          canClear = value.isNotEmpty;
        });
      },
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          suffixIcon: canClear
              ? IconButton(
                  onPressed: () {
                    widget.controller.text = "";
                    setState(() {
                      canClear = false;
                    });
                  },
                  icon: const Icon(Icons.close))
              : null),
    );
  }
}
