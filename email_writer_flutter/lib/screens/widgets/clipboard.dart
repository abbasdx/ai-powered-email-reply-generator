import 'package:email_writer_flutter/controller/email_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CopyToClipboard extends StatelessWidget {
  const CopyToClipboard({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    final EmailController controller = Get.put(EmailController());
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        icon: const Icon(Icons.copy, size: 18),
        label: const Text('Copy to Clipboard'),
        onPressed: () {
          Clipboard.setData(
            ClipboardData(text: controller.generatedReply.value),
          );
          Get.snackbar(
            'Copied!',
            'Reply copied to clipboard',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        },
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
