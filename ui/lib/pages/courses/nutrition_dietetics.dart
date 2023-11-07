import 'package:flutter/material.dart';
import 'package:ui/pages/quiz_page.dart';

class NutritionDietetics extends StatefulWidget {
  const NutritionDietetics({super.key});

  @override
  State<NutritionDietetics> createState() => _NutritionDieteticsState();
}

class _NutritionDieteticsState extends State<NutritionDietetics> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            const Text(
              'Bachelor of Science in Nutrition and Dietetics',
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
                TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const QuizPage(courseId: 4, category: 'General')),
                    );
                  },
                  icon: const Icon(Icons.chevron_right),
                  label: const Text(''),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey.shade400,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.fromLTRB(15.0, 5.0, 5.0, 5.0)
                  ),
                )
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
                TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const QuizPage(courseId: 4, category: 'Professional')),
                    );
                  },
                  icon: const Icon(Icons.chevron_right),
                  label: const Text(''),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey.shade400,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.fromLTRB(15.0, 5.0, 5.0, 5.0)
                  ),
                )
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
                TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const QuizPage(courseId: 4, category: 'Specialization')),
                    );
                  },
                  icon: const Icon(Icons.chevron_right),
                  label: const Text(''),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey.shade400,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.fromLTRB(15.0, 5.0, 5.0, 5.0)
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}