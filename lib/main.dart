import 'package:aevex_demo/bloc/input_cubit/input_cubit.dart';
import 'package:aevex_demo/pages/input_page.dart';
import 'package:aevex_demo/repositories/data_type_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<DataTypeRepository>(constructDb());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aevex Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (_) => InputCubit(InputStateInitial()),
          child: const InputPage(title: 'Aevex Demo Input Page')),
    );
  }
}
