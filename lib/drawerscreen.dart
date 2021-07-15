import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/drawer.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
            ),
          ),
          Positioned(
            top: 64,
            left: 50,
            child: Container(
              height: 126,
              width: 270,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35.0),
                          image: DecorationImage(
                            image: AssetImage('assets/user.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color:Color(0xFFFD3566).withOpacity(0.3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Column(
                            children: [
                              Text('Cole Kiester',
                              style: TextStyle(
                                fontFamily: 'Oswald',
                                fontWeight: FontWeight.w100,
                                color: Colors.white,
                                fontSize: 30.0,
                              )
                              ),
                              Center(
                                child: Text('Traveller',
                                    style: TextStyle(
                                      fontFamily: 'Oswald',
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1,
                                      color: Colors.white,
                                      fontSize: 15.0,
                                    )
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 190,
            left: 175,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 150),
              curve: Curves.fastLinearToSlowEaseIn,
              height: 550,
              width: 230,
              // color: Colors.black.withOpacity(0.5),
              child: Column(
                children: [
                  _buildMenuItem(Icons.person,'Profile'),
                  _buildMenuItem(Icons.restaurant_outlined,'Nearby\n Restaurants'),
                  _buildMenuItem(Icons.search,'Search'),
                  _buildMenuItem(Icons.notifications,'Alerts'),
                  _buildMenuItem(Icons.settings,'Setting'),
                  _buildMenuItem(Icons.help_center,'Support'),
                  _buildMenuItem(Icons.logout,'Logout'),
                  // Divider(
                  //   height: 100,
                  //   thickness: 10,
                  //   indent: 20,
                  //   endIndent: 20,
                  //
                  // ),
                  // SizedBox(height:200)


                ],


              ),





            ),

          ),
          Divider(
            height: 100,
            thickness: 10,
            indent: 20,
            endIndent: 20,

          ),
        ],
      ),
    );
  }
  Widget _buildMenuItem(icondata,String menuitem){
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
    children: [
      InkWell(
        onTap: (){},
        splashColor: Colors.green,
        child: Padding(
          padding: const EdgeInsets.only(left: 65.0),
          child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          curve: Curves.easeInCubic,
          height: 50,
          width: 230,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
              ),
              child: Icon(
                 icondata,
                size: 20.0,
                ),
            ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(menuitem,
                style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),),
              )

  ],
  ),



          ),
        ),
      ),
  Divider(height: 20,
  thickness: 5,
  indent: 75,
  endIndent: 0,),
  ],
    );
  }
}
