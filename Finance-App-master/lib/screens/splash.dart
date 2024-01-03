import 'package:flutter/material.dart';
import 'package:financia/Screens/introduction.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  double opacityLevel = 0.0; 

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        opacityLevel = 1.0;
      });
    });

    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => IntroductionScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeInOutCubic));

            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 800),
        ),
      );
    }
   );
  }


  @override
Widget build(BuildContext context) {
  return Scaffold(
    body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
           
            Column(
              children: [
                AnimatedOpacity(
                  opacity: opacityLevel,
                  duration: Duration(seconds: 1),
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Flexible(
                      child: Image.asset(
                        'images/splash.png',
                        height: 200, // Adjust the height as needed
                      ),
                    ),
                  ),
                ),
              ],
            ),
            
            Hero(
              tag: 'financia_text',
              child: Material(
                color: Colors.transparent,
                child: Text(
                  'C A S H C R A F T',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 91, 90, 90),
                    fontFamily: 's',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  
}
}
