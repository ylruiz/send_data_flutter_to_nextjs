import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:universal_html/html.dart' as html;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Flutter example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: _submitData,
            child: const Text('Send data to Next.js'),
          ),
        ),
      ),
    );
  }

  Future<void> _submitData() async {
    final dio = Dio();

    final response = await dio.post(
      'https:/http://localhost:3000/api/user_details',
      data: {
        'name': 'Yunet',
        'email': 'test@gmail.com',
      },
    );

    if (response.statusCode == 200) {
      // Navigate to the prefill form page
      html.window.open('https://localhost:3000/page', '_blank');
    } else {
      log('Failed to send data');
    }
  }
}
