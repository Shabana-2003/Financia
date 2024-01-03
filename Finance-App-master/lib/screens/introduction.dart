import 'package:financia/widgets/bottomnavigationbar.dart';
import 'package:flutter/material.dart';

class IntroductionScreen extends StatefulWidget {
  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final PageController _controller = PageController(initialPage: 0);
  int _currentPage = 0; 
  List<IntroductionItem> _introductionItems = [
    IntroductionItem(
      image: 'images/image11.jpeg',
      title: 'Welcome to CashCraft',
      description:
          'Your one-stop financial hub for managing, tracking, and growing your money.',
    ),
    IntroductionItem(
      image: 'images/image22.jpeg',
      title: 'Join CashCraft',
      description: 'With CashCraft, financial empowerme is at your fingertips.',
    ),
    IntroductionItem(
      image: 'images/image33.jpeg',
      title: 'Explore CashCraft',
      description:
          'Are you ready to take charge of your financial future? increasing your financial assets.',
    ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/backg.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          PageView.builder(
            controller: _controller,
            itemCount: _introductionItems.length, 
            onPageChanged: (page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return _buildIntroductionPage(_introductionItems[index]);
            },
          ),
          _buildNextButton(),
        ],
      ),
    );
  }

  Widget _buildIntroductionPage(IntroductionItem item) {
    return Container(
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(item.image),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              item.title,
              style: TextStyle(
                fontSize: 20,
                color: const Color.fromARGB(255, 11, 11, 11),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                item.description,
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 171, 166, 166),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(70.0),
        child: ElevatedButton(
          onPressed: () {
            if (_currentPage < _introductionItems.length - 1) {
              _controller.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            } else {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => Bottom(), 
                ),
              );
            }
          },
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(
                  horizontal: 50.0,
                  vertical: 15.0
                  ), 
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(15.0), 
              ),
            ),

            backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromARGB(255, 47, 125, 121)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_currentPage == _introductionItems.length - 1
                  ? 'Get Started'
                  : 'Next'),
            ],
          ),
        ),
      ),
    );
  }
}

class IntroductionItem {
  final String image;
  final String title;
  final String description;

  IntroductionItem({
    required this.image,
    required this.title,
    required this.description,
  });
}

void main() {
  runApp(MaterialApp(
    home: IntroductionScreen(),
  ));
}
