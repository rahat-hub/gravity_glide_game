import 'package:flutter/material.dart';
import 'package:gravity_glide/HomeScreen/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 3)),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/back.jpg'),
                      fit: BoxFit.cover
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Image.asset('assets/images/splash.png',
                              width: 350.0,
                              height: 350.0,
                            ),
                          )
                        ],
                      ),
                      const Text('Gravity Glide',
                        style: TextStyle(
                          fontSize: 90.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Signatra',
                          color: Colors.red,
                        ),
                      ),
                      const Text('Ball Runner',
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Signatra',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          else {
            return const HomeScreen();
          }
        }
    );
  }
}
