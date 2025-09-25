import 'package:email_writer_flutter/controller/email_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OutputTextField extends StatelessWidget {
  const OutputTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final EmailController controller = Get.put(EmailController());
    return TextField(
      controller: TextEditingController(text: controller.generatedReply.value),
      readOnly: true,
      maxLines: 10,
      minLines: 4,
      style: const TextStyle(color: Colors.black, fontSize: 16),
      decoration: InputDecoration(
        labelText: 'Generated Reply',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
