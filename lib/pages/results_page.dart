import 'package:aevex_demo/models/data_type.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  int count = 1;
  final List<DataType> data = List.generate(
      20,
      (index) => DataType(
          firstName: 'firstName$index',
          lastName: 'lastName$index',
          randomNumber: index.toString()));

  _fetchData() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      data.addAll(List.generate(
          20,
          (index) => DataType(
              firstName: 'firstName${index + (20 * count)}',
              lastName: 'lastName${index + (20 * count)}',
              randomNumber: (index + (20 * count)).toString())));
      count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              child: ListView.builder(
                  itemCount: data.length + 1,
                  itemBuilder: (context, index) {
                    if (index < data.length) {
                      var dataType = data[index];
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
                      _fetchData();
                      return SizedBox(
                        height: 80,
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: CircularProgressIndicator())
                            ],
                          ),
                        ),
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
