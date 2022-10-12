import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TestingWidgetView extends ConsumerWidget {
  const TestingWidgetView({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    TestingWidgetController controller = ref.watch(testingWidgetController);
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Testing Widget',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              QimagePicker(
                id: "photo",
                value: null,
                onChanged: (value) {},
                label: "Image Product",
              ),
              QTextfieldLoginEmail(onChanged: (value) {}, id: "email"),
              const SizedBox(
                height: 50.0,
              ),
              const SizedBox(
                height: 50.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
                onPressed: () {
                  var photo = Input.get("photo");
                  var email = Input.get("email");
                  debugPrint("photo: $photo");
                  debugPrint("image: $email");
                },
                child: const Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
