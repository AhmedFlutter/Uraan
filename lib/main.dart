import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uraan/routes.dart';
import 'package:uraan/screens/splash/splash_screen.dart';
import 'package:uraan/theme.dart';

void main() {
  try {
  WidgetsFlutterBinding.ensureInitialized();
  } catch (e) {
    print(e.toString());
  }
  runApp(App());
}

class MyAwesomeApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}


class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Flutter Demo",
            home: Scaffold(
              body: Center(child: Text("Please check your internet connection")),
            ),
          );
          // return Text("Please Check your internet Connection");
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyAwesomeApp();
        }

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Flutter Demo",
          home: Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
