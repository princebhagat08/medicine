import 'package:flutter/material.dart';
import 'package:medicine/const/app_color.dart';
import 'package:medicine/const/app_img.dart';

import 'home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    return  Scaffold(
      body: Stack(
        children: <Widget>[
          // Main content of the screen
          _getChildren()[_currentIndex],
          // Custom Bottom Navigation Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16)),
              child: BottomNavigationBar(
                currentIndex: _currentIndex,
                backgroundColor: Colors.grey.shade200,
                type: BottomNavigationBarType.fixed,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Image.asset(
                        homeIcon,
                        width: 24,
                        height: 24,
                        color: _currentIndex == 0 ? AppColor.primaryColor : Colors.black,
                      ),
                    ),
                    label: 'HOME',
                  ),
                  BottomNavigationBarItem(
                    icon: SizedBox.shrink(), // Placeholder for the center icon
                    label: '', // Empty label for the center item
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Image.asset(
                        reportIcon,
                        width: 24,
                        height: 24,
                        color: _currentIndex == 2 ? AppColor.primaryColor : Colors.black,
                      ),
                    ),
                    label: 'REPORT',
                  ),

                ],
                onTap: (index) {
                  // setState(() {
                  //   if (index == 2) {
                  //     Navigator.push(context, MaterialPageRoute(builder: (context) => ReceiptTimeLineScreen()));
                  //     // Handle the center button tap if needed
                  //   } else {
                  //     _currentIndex = index;
                  //   }
                  // });
                },
                unselectedLabelStyle: TextStyle(color: Colors.black, fontSize: 12),
                selectedLabelStyle: TextStyle(color: AppColor.primaryColor, fontSize: 14),
                selectedItemColor: AppColor.primaryColor,
                unselectedItemColor: Colors.black,
              ),
            ),
          ),

          // Floating Action Button for the center
          Positioned(
            bottom: 50,
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: FloatingActionButton(
              backgroundColor: Colors.black,

              onPressed: () {

              },
              child: Icon(Icons.add, color: Colors.white),
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }


  List<Widget> _getChildren() {
    return [
      HomeScreen(),

    ];
  }

}
