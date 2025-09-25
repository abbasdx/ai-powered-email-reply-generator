import 'package:email_writer_flutter/controller/email_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final EmailController controller = Get.put(EmailController());
    return TextField(
      maxLines: 10,
      minLines: 4,
      onChanged: (val) => controller.emailContent.value = val,
      style: const TextStyle(color: Colors.black, fontSize: 16),
      decoration: InputDecoration(
        labelText: 'Paste your email content here',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
