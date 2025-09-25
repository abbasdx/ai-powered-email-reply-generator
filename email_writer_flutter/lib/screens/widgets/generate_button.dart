import 'package:email_writer_flutter/controller/email_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenerateButton extends StatelessWidget {
  const GenerateButton({super.key});

  @override
  Widget build(BuildContext context) {
    // Use Get.find() to get the EXISTING controller instance
    final EmailController controller = Get.find<EmailController>();

    // Wrap the UI in an Obx to make it reactive
    return Obx(() {
      return Container(
        decoration: BoxDecoration(
          // Dim the button when it's disabled
          gradient: LinearGradient(
            colors:
                (controller.isLoading.value ||
                        controller.emailContent.value.isEmpty)
                    ? [Colors.grey.shade400, Colors.grey.shade500]
                    : const [Color(0xFF6366F1), Color(0xFF3B82F6)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color:
                  (controller.isLoading.value ||
                          controller.emailContent.value.isEmpty)
                      ? Colors.transparent
                      : const Color(0xFF6366F1).withOpacity(0.4),
              blurRadius: 14,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            // Logic to disable the onTap is now correctly re-evaluated
            onTap:
                controller.isLoading.value ||
                        controller.emailContent.value.isEmpty
                    ? null
                    : () => controller.generateReply(),
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              width: double.infinity,
              alignment: Alignment.center,
              // The UI now correctly switches between loader and text
              child:
                  controller.isLoading.value
                      ? const SizedBox(
                        height: 26,
                        width: 26,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ),
                      )
                      : const Text(
                        '✨ Generate Reply',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
            ),
          ),
        ),
      );
    });
  }
}
