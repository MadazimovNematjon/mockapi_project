import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockapi_project/pages/home_page.dart';

import 'bloc/list_post_cubit.dart';

void main() {
  runApp(
    BlocProvider<ListPostCubit>(
      create: (context) => ListPostCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

