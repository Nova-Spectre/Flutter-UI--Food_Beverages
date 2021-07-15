import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xoffset = 0;
  double yoffset = 0;
  double scalefactor = 1;

  bool isDrawerOpen = false;

  var selectedFood = 'BURGER';
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xoffset, yoffset, 0)
        ..scale(scalefactor),
      duration: Duration(milliseconds: 250),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 400.0,
                ),
                ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.black, Colors.transparent])
                          .createShader(
                              Rect.fromLTRB(0, 0, rect.width, rect.height));
                    },
                    blendMode: BlendMode.dstIn,
                    child: Image.asset('assets/tokyo.jpg',
                        height: 300.0, fit: BoxFit.cover)),
                RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    'JAPAN',
                    style: TextStyle(
                        fontSize: 75,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(0.3),
                        letterSpacing: 10.0),
                  ),
                ),
                Positioned(
                  top: 4.0,
                  right: 4.0,
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white),
                    child: Center(
                      child: isDrawerOpen
                          ? IconButton(
                              icon: Icon(Icons.arrow_back_ios,size: 20.0),
                              onPressed: () {
                               setState(() {
                                 xoffset = 0;
                                 yoffset = 0;
                                 scalefactor = 1;
                                 isDrawerOpen = false;
                               });
                              },
                            )
                          : IconButton(
                              icon: Icon(Icons.menu),
                              onPressed: () {
                                setState(() {
                                  xoffset = -80;
                                  yoffset = 200;
                                  scalefactor = 0.6;
                                  isDrawerOpen = true;
                                });
                              },
                            ),
                    ),
                  ),
                ),
                Positioned(
                  top: 2,
                  right: 5,
                  child: Container(
                    height: 12.0,
                    width: 12.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: Color(0xFFFD3664)),
                  ),
                ),
                Positioned(
                  top: 200.0,
                  left: 40.0,
                  child: Column(
                    children: [
                      Text(
                        'WELCOME TO',
                        style: TextStyle(
                            fontFamily: 'Oswald',
                            fontSize: 32.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 235.0,
                  left: 40.0,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'TOKYO',
                            style: TextStyle(
                                fontFamily: 'Oswald',
                                fontWeight: FontWeight.bold,
                                fontSize: 60.0,
                                color: Color(0xFFFD3664)),
                          ),
                          Text(
                            ',',
                            style: TextStyle(
                              fontFamily: 'Oswald',
                              fontWeight: FontWeight.bold,
                              fontSize: 60.0,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            'JAPAN',
                            style: TextStyle(
                              fontFamily: 'Oswald',
                              fontWeight: FontWeight.bold,
                              fontSize: 60.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 330.0,
                  left: 25.0,
                  right: 25.0,
                  child: Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF262626),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Lets explore some food here....',
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Montserrat',
                              fontSize: 12.0),
                          contentPadding: EdgeInsets.only(top: 15.0),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          )),
                      cursorColor: Colors.white,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildmenuItem('BURGER', Icons.fastfood_outlined),
                _buildmenuItem('TEA', Icons.local_drink),
                _buildmenuItem('BEER', Icons.local_drink),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildmenuItem('CAKE', Icons.cake),
                _buildmenuItem('COFFEE', Icons.cloud),
                _buildmenuItem('MEAT', Icons.restaurant),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildmenuItem('ICE', Icons.insert_chart),
                _buildmenuItem('FISH', Icons.filter_tilt_shift),
                _buildmenuItem('DONUTS', Icons.donut_small),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildmenuItem(String foodName, iconData) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        selectMenuOption(foodName);
      },
      child: AnimatedContainer(
        curve: Curves.easeIn,
        duration: Duration(milliseconds: 300),
        height: selectedFood == foodName ? 115.0 : 90.0,
        width: selectedFood == foodName ? 115.0 : 90.0,
        color:
            selectedFood == foodName ? Color(0xFFFD3566) : Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: selectedFood == foodName ? Colors.white : Colors.grey,
              size: 25.0,
            ),
            SizedBox(height: 12.0),
            Text(foodName,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    color:
                        selectedFood == foodName ? Colors.white : Colors.grey,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.3,
                    fontSize: 10.0))
          ],
        ),
      ),
    );
  }

  selectMenuOption(String foodName) {
    setState(() {
      selectedFood = foodName;
    });
  }
}
