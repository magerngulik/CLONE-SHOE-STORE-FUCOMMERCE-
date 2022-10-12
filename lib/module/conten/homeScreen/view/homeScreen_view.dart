import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/homeScreen_controller.dart';

class HomeScreenView extends ConsumerWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    HomeScreenController controller = ref.watch(homeScreenController);
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Screen'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: const [
              //body
            ],
          ),
        ),
      ),
    );
  }
}
