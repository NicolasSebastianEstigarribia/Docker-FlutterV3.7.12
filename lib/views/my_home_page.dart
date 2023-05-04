import 'package:flutter/material.dart';
import 'package:movie_admin/view_models/my_home_page_model.dart';

import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Admin'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<MyViewModel>(
              builder: (context, viewModel, child) => Text(
                viewModel.message,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            TextField(
              controller: _textEditingController,
            ),
            ElevatedButton(
              child: const Text('Update'),
              onPressed: () {
                Provider.of<MyViewModel>(context, listen: false).updateMessage(_textEditingController.text);
              },
            )
          ],
        ),
      ),
    );
  }
}
