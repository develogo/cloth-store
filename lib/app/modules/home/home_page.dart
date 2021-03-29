import 'package:cloth_store/app/constants.dart';
import 'package:cloth_store/app/modules/home/components/category_card_widget.dart';
import 'package:cloth_store/app/modules/home/components/cloth_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cloth_store/app/modules/home/home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                SafeArea(child: SizedBox(height: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                    IconButton(
                      splashRadius: 26,
                      iconSize: 26,
                      onPressed: () {},
                      icon: Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                color: kMainColor,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  height: 30,
                  child: ListView.separated(
                      itemCount: controller.categories.length,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => Container(
                            width: 10,
                          ),
                      itemBuilder: (context, index) => CategoryCardWidget(
                            selected: index == 0 ? true : false,
                            title: controller.categories[index],
                          )),
                ),
                SizedBox(height: 20),
                Expanded(
                  flex: 10,
                  child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => Container(
                            width: 20,
                          ),
                      itemBuilder: (context, index) => ClothCardWidget(
                            tag: index,
                            title: controller.products1[index],
                            discount: index == 1 ? '- 30%' : '',
                            onTap: () {
                              Map<String, dynamic> args = {
                                'title': controller.products1[index],
                                'tag': index.toString(),
                              };
                              return Modular.to.pushNamed(
                                '/cloth',
                                arguments: args,
                              );
                            },
                          )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Text(
                        kRecommendedForYou,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: ListView.separated(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => Container(
                      width: 10,
                    ),
                    itemBuilder: (context, index) => Container(
                      height: 30,
                      width: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/images/${index + 4}.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
            Positioned(
              bottom: 15,
              child: Container(
                height: 55,
                width: 85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey.shade800,
                ),
                child: MaterialButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.search,
                      size: 34,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
