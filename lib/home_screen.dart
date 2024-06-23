import 'package:bloc_tutorial_login_bloc_4/bloc/auth_bloc.dart';
import 'package:bloc_tutorial_login_bloc_4/login_screen.dart';
import 'package:bloc_tutorial_login_bloc_4/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(authState.uid),
      // ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
                (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const CircularProgressIndicator();
          }
          return Center(
            child: Column(
              children: [
                Text((state as AuthSuccess).uid),
                GradientButton(onPressed: () {
                  context.read<AuthBloc>().add(AuthLogoutRequested());
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}
