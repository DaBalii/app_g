
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:zon_gneapp/providers/home_provider.dart';
import 'package:zon_gneapp/screens/Login.dart';
import 'package:zon_gneapp/screens/provider.dart';

void  main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Geolocator.requestPermission();

  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => UserProvider()),ChangeNotifierProvider(create: (_) => HomesPrivders())],

    child: zon_gneapp(),
  ));
}

class zon_gneapp extends StatelessWidget {
  const zon_gneapp( {super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginApp(),
    );
  }
}