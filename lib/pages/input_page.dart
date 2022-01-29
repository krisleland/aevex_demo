import 'package:aevex_demo/bloc/input_cubit/input_cubit.dart';
import 'package:aevex_demo/pages/results_page.dart';
import 'package:aevex_demo/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _randomNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child:
              BlocConsumer<InputCubit, InputState>(listener: (context, state) {
            if (state is InputStateSubmitSuccess) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ResultsPage()));
            }
          }, builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InputWidget(
                  label: 'Enter your first name',
                  controller: _firstNameController,
                ),
                InputWidget(
                  label: 'Enter your last name',
                  controller: _lastNameController,
                ),
                InputWidget(
                  label: 'Enter a random number',
                  controller: _randomNumberController,
                ),
                TextButton(
                    onPressed: () => context.read<InputCubit>().submit(
                        firstName: _firstNameController.text,
                        lastName: _lastNameController.text,
                        randomNumber: _randomNumberController.text),
                    child: const Text('Submit')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () =>
                            context.read<InputCubit>().addHundred(),
                        child: const Text('Add 100 entries')),
                    TextButton(
                        onPressed: () =>
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => const ResultsPage())),
                        child: const Text('View results'))
                  ],
                ),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Visibility(
                    visible: state is InputStateLoading,
                    child: const CircularProgressIndicator(),
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
