import 'package:flutter/material.dart';

class TechnicalVocational extends StatefulWidget {
  const TechnicalVocational({super.key});

  @override
  State<TechnicalVocational> createState() => _TechnicalVocationalState();
}

class _TechnicalVocationalState extends State<TechnicalVocational> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            const Text(
              'Bachelor of Technical-Vocational Teacher Education',
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