import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/cubit/cubit_cubit.dart';
import 'package:tourism/misc/colors.dart';
import 'package:tourism/widgets/app_text.dart';
import 'package:tourism/widgets/large_text.dart';
import 'package:tourism/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    'welcome-one.png',
    'welcome-two.png',
    'welcome-three.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (context, index) => Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                // ignore: prefer_interpolation_to_compose_strings
                'assets/img/' + images[index],
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            margin: const EdgeInsets.only(
              top: 120,
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppLargeText(text: 'Trips'),
                    AppText(
                      text: 'Mountains',
                      size: 30,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: AppText(
                        text:
                            'lorem ipsum mont gomeri, rada rada, kini lon dummy text and so on',
                        size: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<CubitCubit>(context).getData();
                      },
                      child: SizedBox(
                        width: 200,
                        child: Row(
                          children: [
                            ResponsiveButton(
                              width: 120,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: List.generate(
                    3,
                    (indexDots) => Container(
                      margin: const EdgeInsets.only(top: 5),
                      width: 8,
                      height: index == indexDots ? 25 : 8,
                      decoration: BoxDecoration(
                        color: index == indexDots
                            ? AppColors.mainColor
                            : Colors.grey[500],
                        borderRadius: BorderRadius.circular(
                          12,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
