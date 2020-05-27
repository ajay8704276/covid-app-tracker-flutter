import 'package:flutter/material.dart';

import '../datasource.dart';

class FAQs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAQs Section"),
      ),
      body: ListView.builder(
          itemCount: DataSource.questionAnswers.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(0),
              child: ExpansionTile(
                title: Text(DataSource.questionAnswers[index]["question"]),
                children: [Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(DataSource.questionAnswers[index]["answer"]),
                )],
              ),
            );
          }),
    );
  }
}
