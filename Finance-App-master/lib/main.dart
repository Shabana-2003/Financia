import 'package:financia/Screens/splash.dart';
import 'package:financia/widgets/bottomnavigationbar.dart';
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

  Box<FinancesData> dataBox = Hive.box<FinancesData>('data');
  bool hasFinancialData = dataBox.isNotEmpty;

  runApp(MyApp(hasFinancialData: hasFinancialData));
}

class MyApp extends StatelessWidget {
  final bool hasFinancialData;

  const MyApp({Key? key, required this.hasFinancialData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: hasFinancialData ? Bottom() : Splash(),
    );
  }
}
