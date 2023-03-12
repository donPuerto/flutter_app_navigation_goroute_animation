import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.push('/profile'),
          child: const Text('Navigate to Profile'),
        ),
      ),
    );
  }
}
