import 'dart:io';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Sets a platform override for desktop to avoid exceptions. See
// https://flutter.dev/desktop#target-platform-override for more info.
void _enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

void main() {
  _enablePlatformOverrideForDesktop();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avatar Glow Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final values = [
      [0.1, 0.0],
      [0.2, 0.0],
      [0.3, 0.0],
      [0.4, 0.0],
      [0.5, 0.0],
      [0.6, 0.0],
      [0.7, 0.0],
      [0.8, 0.0],
      [0.9, 0.0],
      [1.0, 0.0],
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Container(
        child: ListView(
          children: values.map((e) {
            return AvatarGlow(
              fromOpacityValue: e.first,
              toOpacityValue: e.last,
              glowColor: Colors.blue,
              endRadius: 90.0,
              duration: Duration(milliseconds: 2000),
              repeat: true,
              showTwoGlows: true,
              repeatPauseDuration: Duration(milliseconds: 100),
              child: Material(
                elevation: 8.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[100],
                  child: Image.asset(
                    'assets/images/flutter.png',
                    height: 60,
                  ),
                  radius: 40.0,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
