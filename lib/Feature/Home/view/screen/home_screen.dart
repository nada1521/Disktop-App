import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await windowManager.destroy();
            },
            icon: Icon(Icons.close, color: Colors.black),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'مرحبًا بك في الوضع الكامل! 🌟',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
  
}
