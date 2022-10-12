import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/demo_controller.dart';

class DemoView extends ConsumerWidget {
  const DemoView({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    DemoController controller = ref.watch(demoController);
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Demo'),
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
