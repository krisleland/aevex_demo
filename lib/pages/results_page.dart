import 'package:aevex_demo/repositories/data_type_repository.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  final repo = getIt.get<DataTypeRepository>();
  List<Entry> data = [];
  bool moreResults = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    var newData = await repo.getAll();
    setState(() {
      data = newData;
    });
  }

  void _fetchMoreData() async {
    if (mounted && moreResults) {
      var moreData = await repo.getAll(offset: data.length);
      setState(() {
        if (moreData.isEmpty) {
          moreResults = false;
        } else {
          data.addAll(moreData);
        }
      });
    }
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
                      _fetchMoreData();
                      return SizedBox(
                        height: 80,
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  child: moreResults
                                      ? const CircularProgressIndicator()
                                      : const Text('No more results'))
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
