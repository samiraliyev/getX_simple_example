import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getx_test/controller/app_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  //texteditingcontroller for textfield
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // this line is used to create the controller for the text field with the GetxTestController
    final InputTextController inputTextController =
        Get.put(InputTextController());
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: const Text('AppBar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              style: const TextStyle(
                color: Colors.white,
              ),
              controller: _textEditingController,
              decoration: const InputDecoration(
                label: Text("Enter your name"),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.cyan,
                  ),
                ),
              ),
              onChanged: (text) {
                inputTextController.displayText.value = text;
              },
            ),
            const SizedBox(height: 20.0),
            Obx(() => DefaultTextStyle(
                  style: const TextStyle(fontSize: 20.0, color: Colors.white),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText(
                        inputTextController.displayText.value,
                      ),
                      WavyAnimatedText(
                        inputTextController.displayText.value,
                      ),
                    ],
                    isRepeatingAnimation: true,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
