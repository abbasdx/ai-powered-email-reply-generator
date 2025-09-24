import 'package:email_writer_flutter/services/ai_service.dart';
import 'package:get/get.dart';

class EmailController extends GetxController {
  var emailContent = ''.obs;
  var tone = ''.obs;
  var generatedReply = ''.obs;
  final error = ''.obs;
  var isLoading = false.obs;

  Future<void> generateReply() async {
    if (emailContent.value.isEmpty) return;

    try {
      isLoading.value = true;
      final reply = await AIService.generateReply(emailContent.value, tone.value);
      generatedReply.value = reply;
    } catch (e) {
      generatedReply.value = 'Failed to generate reply';
    } finally {
      isLoading.value = false;
    }
  }
}
