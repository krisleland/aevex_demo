import 'package:aevex_demo/bloc/results_cubit/results_cubit.dart';
import 'package:aevex_demo/bloc/results_cubit/results_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ResultsCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Back')),
                  const SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    child: BlocBuilder<ResultsCubit, ResultsState>(
                      builder: (context, state) {
                        return ListView.builder(
                            itemCount: state.entries.length + 1,
                            itemBuilder: (context, index) {
                              if (index < state.entries.length) {
                                var dataType = state.entries[index];
                                return SizedBox(
                                    height: 80,
                                    child: Card(
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(dataType.firstName),
                                            Text(dataType.lastName),
                                            Text(dataType.randomNumber),
                                          ]),
                                    ));
                              } else {
                                context.read<ResultsCubit>().getMoreData();
                                return SizedBox(
                                  height: 80,
                                  child: Card(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                            child: state.moreResults
                                                ? const CircularProgressIndicator()
                                                : const Text('No more results'))
                                      ],
                                    ),
                                  ),
                                );
                              }
                            });
                      }
                    ),
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
