import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui/models/user.dart';
import 'package:ui/modules/nav_bar.dart';
// import 'package:ui/modules/recently_added.dart';
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
  late Future<User> authuser;
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, initialIndex: 0, vsync: this);
    authuser = UserService().getUser();
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
        child: FutureBuilder(
          future: authuser,
          builder: ((context, AsyncSnapshot snapshot) {
            if(snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 20),
                  // Container(
                  //   padding: const EdgeInsets.only(bottom: 20),
                  //   child: TabBar(
                  //     controller: _tabController,
                  //     isScrollable: true,
                  //     labelColor: Colors.blue,
                  //     unselectedLabelColor: Colors.grey[600],
                  //     indicator: const CircleTabIndicator(color: Colors.blue, radius: 4),
                  //     tabs: const [
                  //       Tab(child: Text('Secondary Education')),
                  //       Tab(child: Text('Technical Vocational')),
                  //       Tab(child: Text('Technology and Livelihood')),
                  //       Tab(child: Text('Nutrition and Dietetics')),
                  //       Tab(child: Text('Social Work')),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   width: double.maxFinite,
                  //   height: 250,
                  //   child: TabBarView(
                  //     controller: _tabController,
                  //     children: const [
                  //       SecondaryEducation(),
                  //       TechnicalVocational(),
                  //       TechnologyLivelihood(),
                  //       NutritionDietetics(),
                  //       SocialWork(),
                  //     ],
                  //   ),
                  // ),

                  dashboardContent(snapshot.data!.courseId),

                  const Divider(height: 10),
                  // const Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                  //   child: Align(
                  //     alignment: Alignment.topLeft,
                  //     child: Text(
                  //       'RECENTLY ADDED',
                  //       style: TextStyle(
                  //         fontSize: 16.0,
                  //         fontWeight: FontWeight.bold
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  //   child: const RecentlyAdded(),
                  // )
                ]
              );
            } else if(snapshot.hasError) {
              return Text('ERROR: ${snapshot.error}');
            }

            return SizedBox(
              height: MediaQuery.of(context).size.height / 1.3,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          })
        )
      ),
    );
  }

  dashboardContent(courseId) {
    if(courseId == 1) {
      return const SecondaryEducation();
    }
    if(courseId == 2) {
      return const TechnicalVocational();
    }
    if(courseId == 3) {
      return const TechnologyLivelihood();
    }
    if(courseId == 4) {
      return const NutritionDietetics();
    }
    if(courseId == 5) {
      return const SocialWork();
    }

    return Container();
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