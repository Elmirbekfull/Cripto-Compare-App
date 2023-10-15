import 'package:flutter/material.dart';

export 'view/view.dart';

class Extension extends StatelessWidget {
  const Extension({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return;
      },
    );
  }
}
