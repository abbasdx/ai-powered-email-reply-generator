import 'package:email_writer_flutter/controller/email_controller.dart';
import 'package:email_writer_flutter/screens/widgets/appbar.dart';
import 'package:email_writer_flutter/screens/widgets/clipboard.dart';
import 'package:email_writer_flutter/screens/widgets/dropdown_menu.dart';
import 'package:email_writer_flutter/screens/widgets/generate_button.dart';
import 'package:email_writer_flutter/screens/widgets/input_field.dart';
import 'package:email_writer_flutter/screens/widgets/output_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final EmailController controller = Get.put(EmailController());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      appBar: ReplaiAppBar(),
      body: SingleChildScrollView(
        padding:
            kIsWeb
                ? const EdgeInsets.symmetric(vertical: 24, horizontal: 30)
                : const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Input Section
            InputTextField(),
            const SizedBox(height: 24),
            DropdownToneOptions(),
            const SizedBox(height: 24),
            GenerateButton(),
            const SizedBox(height: 16),
            Obx(() {
              if (controller.error.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    controller.error.value,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            }),

            // Output Section
            Obx(() {
              if (controller.generatedReply.isEmpty) {
                return const SizedBox.shrink();
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16), // Added space before output
                  const Text(
                    'Generated Reply:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  OutputTextField(),
                  const SizedBox(height: 16),
                  CopyToClipboard(),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
