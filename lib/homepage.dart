import 'package:flutter/material.dart';

import 'widget/search_widget.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: const [FilterSearch()],
        ),
      ),
    );
  }
}
