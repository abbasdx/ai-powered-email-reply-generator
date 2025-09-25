import 'package:email_writer_flutter/controller/email_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropdownToneOptions extends StatelessWidget {
  const DropdownToneOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final EmailController controller = Get.put(EmailController());
    return DropdownButtonFormField<String>( 
      dropdownColor: Colors.white,
       decoration: InputDecoration(
        prefixIcon: Icon(Icons.menu_outlined),
         labelText: 'Tone (Optional)',
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(8),
         ),
         filled: true,
         fillColor: Colors.white,
       ),
       value: controller.tone.value.isEmpty ? null : controller.tone.value,
       onChanged: (String? newValue) {
         controller.tone.value = newValue ?? '';
       },
       items: const [
        DropdownMenuItem(
          value: '',
          child: Text('None', style: TextStyle(color: Colors.black)),
        ),
        DropdownMenuItem(
          value: 'professional',
          child: Text('Professional', style: TextStyle(color: Colors.black)),
        ),
        DropdownMenuItem(
          value: 'casual',
          child: Text('Casual', style: TextStyle(color: Colors.black)),
        ),
        DropdownMenuItem(
          value: 'friendly',
          child: Text('Friendly', style: TextStyle(color: Colors.black)),
        ),
        DropdownMenuItem(
          value: 'formal',
          child: Text('Formal', style: TextStyle(color: Colors.black)),
        ),
        DropdownMenuItem(
          value: 'encouraging',
          child: Text('Encouraging', style: TextStyle(color: Colors.black)),
        ),
        DropdownMenuItem(
          value: 'neutral',
          child: Text('Neutral', style: TextStyle(color: Colors.black)),
        ),
      ],
     );
  }
}
