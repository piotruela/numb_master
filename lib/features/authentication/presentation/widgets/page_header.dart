import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const PageHeader({
    Key? key,
    this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 44.0, left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!,
            style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
          Text(
            subtitle!,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).unselectedWidgetColor,
            ),
          )
        ],
      ),
    );
  }
}
