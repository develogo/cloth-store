import 'package:cloth_store/app/constants.dart';
import 'package:cloth_store/app/modules/home/pages/cloth/cloth_store.dart';
import 'package:cloth_store/app/modules/home/pages/cloth/components/cloth_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ClothPage extends StatefulWidget {
  final String title;
  final String tag;
  const ClothPage({Key? key, this.title = "ClothPage", required this.tag})
      : super(key: key);
  @override
  ClothPageState createState() => ClothPageState();
}

class ClothPageState extends State<ClothPage> with TickerProviderStateMixin {
  ClothStore controller = ClothStore();

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 400),
    vsync: this,
  );

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0, .2),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  ));

  late final AnimationController _fadeController = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );

  late final Animation<double> _fadeAnimation = CurvedAnimation(
    parent: _fadeController,
    curve: Curves.easeIn,
  );

  final double _initFabHeight = 260.0;

  late double _fabHeight;

  @override
  void initState() {
    _fabHeight = _initFabHeight;

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * .7,
                child: PageView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) => Hero(
                    tag: widget.tag,
                    child: Image.asset(
                      'assets/images/${widget.tag}.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                        ),
                        onPressed: () {
                          _controller.reverse();
                          Modular.to.pop();
                        },
                      )
                    ],
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
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SlideTransition(
              position: _offsetAnimation,
              child: SlidingUpPanel(
                onPanelSlide: (position) {
                  setState(() {
                    _fabHeight = position *
                            (MediaQuery.of(context).size.height * .65 -
                                MediaQuery.of(context).size.height * .34) +
                        _initFabHeight;
                  });
                  _fadeController.value = position;
                },
                panel: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 100,
                          height: 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 8),
                                  Text(
                                    widget.title,
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    '\$ 80',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    'Your Size',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Container(
                                    height: 35,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        sizeButton('S'),
                                        sizeButton('M'),
                                        sizeButton('L'),
                                        sizeButton('XL'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  colorButton(Colors.black, true),
                                  colorButton(Colors.yellow.shade300, false),
                                  colorButton(Colors.red.shade100, false),
                                  colorButton(Colors.grey.shade300, false),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: Column(
                          children: [
                            Observer(
                              builder: (context) => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    height: 30,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: controller.index == 0
                                          ? kMainColor
                                          : Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Details',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.black87),
                                      ),
                                    ),
                                  ),
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    height: 30,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: controller.index == 1
                                          ? kMainColor
                                          : Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Order',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.black87),
                                      ),
                                    ),
                                  ),
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    height: 30,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: controller.index == 2
                                          ? kMainColor
                                          : Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Payment',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.black87),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              height: 200,
                              child: PageView(
                                controller: controller.pageController,
                                onPageChanged: (value) =>
                                    controller.changePage(value),
                                children: [
                                  ClothDetailsWidget(),
                                  ClothDetailsWidget(),
                                  ClothDetailsWidget(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                body: Container(),
                minHeight: MediaQuery.of(context).size.height * .34,
                maxHeight: MediaQuery.of(context).size.height * .65,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * .90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.black,
                ),
                child: MaterialButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      kAddCart,
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 20.0,
              bottom: _fabHeight,
              child: Container(
                height: 40,
                width: 40,
                child: FittedBox(
                  child: FloatingActionButton(
                    child: Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  sizeButton(String v) {
    return Container(
      width: 35,
      child: Card(
        elevation: 4,
        child: MaterialButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
          child: Center(
            child: Text(v),
          ),
        ),
      ),
    );
  }

  colorButton(Color color, bool selected) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: selected
              ? Border.all(
                  width: 1,
                  color: Colors.black,
                )
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ),
    );
  }
}
