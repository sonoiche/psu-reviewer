import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui/modules/nav_bar.dart';
import 'package:ui/modules/recently_added.dart';
import 'package:ui/pages/courses/nutrition_dietetics.dart';
import 'package:ui/pages/courses/social_work.dart';
import 'package:ui/pages/courses/technical_vocational.dart';
import 'package:ui/pages/courses/secondary_education.dart';
import 'package:ui/pages/courses/technology_livelihood.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? _tabController;

  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, initialIndex: 0, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text(
          'PSU Reviewer'
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 5.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'COURSES',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey[600],
                indicator: const CircleTabIndicator(color: Colors.blue, radius: 4),
                tabs: const [
                  Tab(child: Text('Secondary Education')),
                  Tab(child: Text('Technical Vocational')),
                  Tab(child: Text('Technology and Livelihood')),
                  Tab(child: Text('Nutrition and Dietetics')),
                  Tab(child: Text('Social Work')),
                ],
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              height: 250,
              child: TabBarView(
                controller: _tabController,
                children: const [
                  SecondaryEducation(),
                  TechnicalVocational(),
                  TechnologyLivelihood(),
                  NutritionDietetics(),
                  SocialWork(),
                ],
              ),
            ),
            const Divider(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'RECENTLY ADDED',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: const RecentlyAdded(),
            )
          ]
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final double radius;
  late Color color;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    late Paint paintVal;
    paintVal = Paint()..color = color;
    paintVal = paintVal ..isAntiAlias = true;

    final Offset circleOffset = offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, paintVal);
  }
}