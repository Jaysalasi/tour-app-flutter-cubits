// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/cubit/cubit_cubit.dart';
import 'package:tourism/misc/colors.dart';
import 'package:tourism/widgets/app_text.dart';
import 'package:tourism/widgets/large_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  //
  // this is a map
  var images = {
    "balloning.png": "Balloning",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorkling",
  };
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.menu,
                size: 30,
                color: Colors.black,
              ),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<CubitCubit, CubitState>(
        builder: (context, state) {
          if (state is LoadedState) {
            var info = state.places;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 18),
                  child: AppLargeText(
                    text: 'Discover',
                  ),
                ),

                // TABBAR

                SizedBox(
                  height: 20,
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    controller: tabController,
                    labelPadding: EdgeInsets.symmetric(
                      horizontal: 18,
                    ),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.black38,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: CircleTabIndicator(
                      color: AppColors.mainColor,
                      radius: 4,
                    ),
                    tabs: [
                      Tab(
                        text: 'Places',
                      ),
                      Tab(
                        text: 'Places',
                      ),
                      Tab(
                        text: 'Emotions',
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    top: 10,
                  ),
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: info.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () =>
                              BlocProvider.of<CubitCubit>(context).detailPage(
                            info[index],
                          ),
                          child: Container(
                            margin: EdgeInsets.only(
                              right: 10,
                            ),
                            width: 200,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[50],
                              image: DecorationImage(
                                  image: NetworkImage(
                                    'http://mark.bslmeiyu.com/uploads/${info[index].img}',
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ),
                      Text('2'),
                      Text('25'),
                    ],
                  ),
                ),

                //  EXPLORE

                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(
                        text: 'Explore more',
                        size: 20,
                      ),
                      AppText(
                        text: 'See all',
                        size: 15,
                      ),
                    ],
                  ),
                ),

                // ICONS

                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.only(left: 20, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.18,
                            height: MediaQuery.of(context).size.width * 0.18,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/img/${images.keys.elementAt(index)}"),
                                fit: BoxFit.cover,
                              ),
                              color: Colors.amber,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          AppText(
                            text: images.values.elementAt(index),
                            size: 12,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
