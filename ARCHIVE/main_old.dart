import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:permission_handler/permission_handler.dart';
import '../ARCHIVE/features/home/home_page.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  // await Hive.openBox('music_box');

  // await _initializeStoragePermissions();


  runApp(const MyApp());
}

// Future<void> _initializeStoragePermissions () async {
//   if (await Permission.audio.request().isGranted || await Permission.storage.request().isGranted) {
//     debugPrint("storage permission granted succesfully");
//   } else {
//     debugPrint("storage permission denied");
//   }
// }



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stopify',
      // theme: AppTheme.darkThemeMode,
      home: HomePage(),
      // home: const Scaffold(
      //   body: Center(
      //     child: Text('storage permissions requested!'),
      //   ),
      // ),
    );
  }
}