import 'package:financia/Screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'data/model/hivemodels.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProfileDataAdapter());
  Hive.registerAdapter(AdddataAdapter());
  await Hive.openBox<FinancesData>('data');
  await Hive.openBox<FinancesData>('addDataBox');
  
  await Hive.openBox<ProfileData>('profileBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
