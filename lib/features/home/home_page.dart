import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// class _HomePageState extends State<HomePage> {
//   @override
//   void initState() {
//     super.initState();

//     _checkAndRequestPermissions();
//   }

//   Future<void> _checkAndRequestPermissions() async {
//     // Small delay ensures the native platform activity is fully awake and ready
//     await Future.delayed(const Duration(milliseconds: 500));

//     if (await Permission.audio.request().isGranted || 
//         await Permission.storage.request().isGranted) {
//       debugPrint("Storage permissions granted.");
//     } else {
//       debugPrint("Storage permissions denied.");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Text('home screen'),
//       ),
//     );
//   }
// }

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    
    // This tells Flutter: "Wait until the UI layout is drawn, 
    // which means the Android Activity MUST exist, then run this."
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAndRequestPermissions();
    });
  }

  Future<void> _checkAndRequestPermissions() async {
  // Check the statuses explicitly first
  PermissionStatus audioStatus = await Permission.audio.status;
  PermissionStatus storageStatus = await Permission.storage.status;

  debugPrint("Current Audio Status: $audioStatus");
  debugPrint("Current Storage Status: $storageStatus");

  // If already granted, the OS will deliberately skip showing a dialog
  if (audioStatus.isGranted || storageStatus.isGranted) {
    debugPrint("Dialog skipped: Permissions already granted.");
    return;
  }

  // If permanently denied, the OS blocks the dialog completely. You must send them to settings.
  if (audioStatus.isPermanentlyDenied || storageStatus.isPermanentlyDenied) {
    debugPrint("Dialog blocked: Permanently Denied. Directing user to App Settings.");
    await openAppSettings();
    return;
  }

  // Request explicitly
  Map<Permission, PermissionStatus> statuses = await [
    Permission.audio,
    Permission.storage,
  ].request();

  debugPrint("Request Results: $statuses");
}

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Stopify Music Home Screen'),
      ),
    );
  }
}