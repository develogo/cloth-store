import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ClothCardWidget extends StatelessWidget {
  final String title;
  final int tag;
  final Function() onTap;
  final String discount;
  const ClothCardWidget({
    Key? key,
    this.title = "ClothCardWidget",
    required this.tag,
    required this.onTap,
    this.discount = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Hero(
                    tag: tag.toString(),
                    child: Image.asset(
                      'assets/images/$tag.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                discount.isNotEmpty
                    ? Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey.shade800),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              discount,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "\$ 50",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade500),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
