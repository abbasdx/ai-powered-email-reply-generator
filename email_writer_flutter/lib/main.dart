import 'package:email_writer_flutter/screens/home.dart';
import 'package:email_writer_flutter/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  http.get(Uri.parse(serverUrl))
      .catchError((e) => debugPrint("Server wake-up failed: $e"));
  runApp(const ReplaiApp());
}

class ReplaiApp extends StatelessWidget {
  const ReplaiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Replai',
      home: const HomeScreen(), 
    );
  }
}
