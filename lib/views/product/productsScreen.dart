// ignore_for_file: file_names

import 'package:laba/constants.dart';
import 'package:laba/views/product/components/body.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products Dashboard"),
      ),
      backgroundColor: kPrimaryColor,
      body: const Body(),
    );
  }
}
