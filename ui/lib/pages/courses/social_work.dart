import 'package:flutter/material.dart';

class SocialWork extends StatefulWidget {
  const SocialWork({super.key});

  @override
  State<SocialWork> createState() => _SocialWorkState();
}

class _SocialWorkState extends State<SocialWork> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            const Text(
              'Bachelor of Science in Social Work',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.0
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: const Icon(Icons.quiz_rounded, color: Colors.white),
                ),
                const SizedBox(width: 15),
                Text(
                  'General Education',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14
                  ),
                ),
                const Spacer(),
                const Icon(Icons.chevron_right, color: Colors.grey)
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: const Icon(Icons.quiz_rounded, color: Colors.white),
                ),
                const SizedBox(width: 15),
                Text(
                  'Profesional Education',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14
                  ),
                ),
                const Spacer(),
                const Icon(Icons.chevron_right, color: Colors.grey)
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: const Icon(Icons.quiz_rounded, color: Colors.white),
                ),
                const SizedBox(width: 15),
                Text(
                  'Field of Specialization',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14
                  ),
                ),
                const Spacer(),
                const Icon(Icons.chevron_right, color: Colors.grey)
              ],
            ),
          ],
        ),
      ),
    );
  }
}