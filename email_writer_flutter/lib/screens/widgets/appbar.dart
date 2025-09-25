import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ReplaiAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ReplaiAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
    title: Padding(
      padding: kIsWeb? const EdgeInsets.only(left: 12): const EdgeInsets.all(0),
      child: Row(
        children: [
          // Logo
          SizedBox(width: 35, child: Image(image: AssetImage('assets/replai_logo_1.png'))),
          const SizedBox(width: 10),
          // Column for Title and Tagline
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              // Title
              Text(
                'Replai',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              // Tagline
              Text(
                'AI-Powered Email Reply Generator',
                style: TextStyle(
                  color: Color.fromARGB(255, 216, 216, 216),
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF6366F1), Color(0xFF3B82F6)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    ),
    elevation: 2,
    toolbarHeight: 60,
        );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}