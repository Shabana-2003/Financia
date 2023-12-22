
import 'package:flutter/material.dart';
import 'package:financia/screens/search.dart';
import 'package:financia/screens/categories.dart';
import 'package:financia/screens/viewall.dart';
import 'package:financia/screens/add.dart';
import 'package:financia/screens/home.dart';

class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  int indexColor = 0;
  List<Widget> screens = [Home(), Searchh(), viewAll(), ViewAll()];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[indexColor],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddScreen()));
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xff368983),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.only(top: 7.5, bottom: 7.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildAnimatedIcon(Icons.home, 0),
              buildAnimatedIcon(Icons.search, 1),
              SizedBox(width: 10),
              buildAnimatedIcon(Icons.calendar_today, 2),
              buildAnimatedIcon(Icons.category, 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAnimatedIcon(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          indexColor = index;
        });
        _animationController.reset();
        _animationController.forward();
      },
      child: RotationTransition(
        turns: CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeInOut,
        ),
        child: Icon(
          icon,
          size: 30,
          color: indexColor == index ? Color(0xff368983) : Colors.grey,
        ),
      ),
    );
  }
}
