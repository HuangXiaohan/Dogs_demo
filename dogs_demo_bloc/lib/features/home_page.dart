import 'package:dogs_demo_bloc/features/dog_list/blocs/dog_list_bloc.dart';
import 'package:dogs_demo_bloc/features/dog_list/pages/dog_list_page.dart';
import 'package:dogs_demo_bloc/features/login/blocs/login_bloc.dart';
import 'package:dogs_demo_bloc/features/login/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int index;
  late DogListBloc dogListBloc;

  @override
  void initState() {
    index = 0;
    dogListBloc = DogListBloc();
    dogListBloc.add(DogListInitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dogs demo'),
      ),
      body: MultiBlocProvider(providers: [
        BlocProvider<LoginBloc>(
          create: (_) => LoginBloc(),
        ),
        BlocProvider<DogListBloc>(create: (_) => dogListBloc)
      ], child: _buildBody()),
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
        return const DogListPage();
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
