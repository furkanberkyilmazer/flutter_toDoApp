
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:to_do_app/models/color_theme_data.dart';
import 'package:to_do_app/models/items_data.dart';
import 'package:to_do_app/screens/home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ColorThemeData().createPrefObject();
  await ItemData().createPrefObject();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<ItemData>(
          create: (BuildContext context)=>ItemData()),

      ChangeNotifierProvider<ColorThemeData>(
          create: (context)=>ColorThemeData()),
    ],
    child: MyApp(),

  ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Provider.of<ColorThemeData>(context).loadThemeFromSharedPref();
    Provider.of<ItemData>(context).loadItemsFromSharedPref();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ColorThemeData>(context).selectedThemeData,
      home:  SplashHome(),
    );
  }
}

class SplashHome extends StatefulWidget {
  @override
  _SplashHomeState createState() => _SplashHomeState();
}

class _SplashHomeState extends State<SplashHome> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 3,
        navigateAfterSeconds: HomePage(),
        title: Text(
          'Get It Done',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40.0,
              color: Colors.green.shade700),
        ),
        image: Image.asset('assets/splash_image.png'),
        loadingText: Text('Please Wait...'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: TextStyle(),
        photoSize: 100.0,
        onClick: () => print("hey"),
        loaderColor: Colors.green);
  }
}


