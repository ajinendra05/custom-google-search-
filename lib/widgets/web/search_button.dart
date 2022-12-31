// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_flutter/colors.dart';

class SearchButton extends StatelessWidget {
  final String title;
  const SearchButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      color: searchColor,
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 18,
      ),
      elevation: 0,
      child: Text(
        title,
      ),
      onPressed: () {},
    );
  }
}
