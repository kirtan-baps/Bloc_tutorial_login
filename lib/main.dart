import 'package:bloc_tutorial_login_bloc_4/app_bloc_observer.dart';
import 'package:bloc_tutorial_login_bloc_4/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc_tutorial_login_bloc_4/login_screen.dart';
import 'package:bloc_tutorial_login_bloc_4/pallete.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Pallete.backgroundColor,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
