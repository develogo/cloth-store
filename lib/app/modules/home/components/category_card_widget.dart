import 'package:cloth_store/app/constants.dart';
import 'package:flutter/material.dart';

class CategoryCardWidget extends StatelessWidget {
  final String title;
  final bool selected;
  const CategoryCardWidget({
    Key? key,
    this.title = "CartegoryCardWidget",
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      height: 30,
      width: 85,
      decoration: BoxDecoration(
        color: selected ? kMainColor : Colors.transparent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: MaterialButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
        ),
      ),
    );
  }
}
