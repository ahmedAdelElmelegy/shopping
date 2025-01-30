import 'package:flutter/material.dart';

import 'package:shopping_app/feature/home/presentation/view/widgets/home_app_bar.dart';
import 'package:shopping_app/feature/home/presentation/view/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      body: HomeViewBody(),
    );
  }
}
