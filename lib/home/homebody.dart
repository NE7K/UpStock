import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart'; // shimmer import

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(delegate: SliverChildBuilderDelegate(builder));
  }
}
