import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Importez Firebase Core
import 'package:provider/provider.dart';
import 'auth_provider.dart';
import 'tasklistpage.dart';
import 'sign_up_screen.dart';
import 'sign_in_screen.dart'; // Importez votre SignInPage si nécessaire

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyD3inSRFujny-uhKPnXFxikBQndSNJF96Q",
      authDomain: "YOUR_AUTH_DOMAIN",
      projectId: "todolist-28e5c",
      storageBucket: "YOUR_STORAGE_BUCKET",
      messagingSenderId: "436730264451",
      appId: "1:436730264451:android:dffb1b04833a3ca5e654b6",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(), // Créez une instance unique de AuthProvider
      child: MaterialApp(
        title: 'Your App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/signin',
        routes: {
          '/signin': (context) => SignInPage(),
          '/signup': (context) => SignUpScreen(),
          '/tasklist': (context) => TaskListPage(),
        },
      ),
    );
  }
}
