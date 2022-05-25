import 'package:dogs_demo_provider/features/login/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login/pages/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int index;

  @override
  void initState() {
    index = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dogs demo'),
      ),
      body: MultiProvider(providers: [ChangeNotifierProvider(create: (_) => LoginProvider())], child: _buildBody()),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Dogs Breeds',
          ),
        ],
        currentIndex: index,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildBody() {
    switch (index) {
      case 0:
        return const LoginPage();
      case 1:
        return const LoginPage();
      default:
        return const LoginPage();
    }
  }

  void _onItemTapped(int i) {
    setState(() {
      index = i;
    });
  }
}
