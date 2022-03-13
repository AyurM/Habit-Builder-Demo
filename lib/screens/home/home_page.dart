import 'package:flutter/material.dart';
import 'package:habit_builder_demo/base/base_state.dart';
import 'package:habit_builder_demo/data/model/bottom_nav_data.dart';
import 'package:habit_builder_demo/data/model/quote.dart';
import 'package:habit_builder_demo/res/colors/colors.dart';
import 'package:habit_builder_demo/res/theme/constants.dart';
import 'package:habit_builder_demo/res/views/habit_app_bar.dart';
import 'package:habit_builder_demo/res/views/habit_bottom_navbar/habit_bottom_navbar.dart';
import 'package:habit_builder_demo/res/views/habit_list/habit_list_header.dart';
import 'package:habit_builder_demo/res/views/quote_view.dart';
import 'package:habit_builder_demo/res/views/user_avatar.dart';
import 'package:habit_builder_demo/screens/home/home_cubit.dart';

class HomePage extends StatefulWidget {
  static const String title = 'Homepage';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeCubit, HomeState> {
  @override
  Widget builder(BuildContext context, HomeState state) {
    final Widget userIcon = UserAvatar(
        imageUrl: 'https://randomuser.me/api/portraits/men/97.jpg',
        radius: kDefaultIconButtonSize / 2,
        onPressed: () {});

    const Quote quote = Quote(
        text: 'We first make our habits, and then our habits make us.',
        author: 'Anonymous');

    const List<BottomNavData> navData = [
      BottomNavData(imagePath: 'assets/images/nav_home.png'),
      BottomNavData(imagePath: 'assets/images/nav_courses.png'),
      BottomNavData(imagePath: 'assets/images/nav_community.png'),
      BottomNavData(imagePath: 'assets/images/nav_settings.png'),
    ];

    return Scaffold(
        appBar: HabitAppBar(
          context: context,
          text: HomePage.title,
          leadingIcon: Icons.menu,
          onLeadingPressed: () {},
          trailing: userIcon,
        ),
        body: Stack(
          children: [
            const _HomePageBackground(),
            Column(children: [
              Padding(
                padding: EdgeInsets.all(kDefaultHorizontalPaddingMedium.left),
                child: const QuoteView(quote: quote),
              ),
              const HabitListHeader()
            ]),
            _HomeFab(iconData: Icons.add, onPressed: () {})
          ],
        ),
        extendBody: true,
        bottomNavigationBar: const HabitBottomNavBar(navData: navData));
  }
}

class _HomePageBackground extends StatelessWidget {
  const _HomePageBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child:
          Image.asset('assets/images/home_background.png', fit: BoxFit.cover));
}

class _HomeFab extends StatelessWidget {
  final IconData iconData;
  final double size;
  final void Function()? onPressed;

  const _HomeFab(
      {Key? key,
      required this.iconData,
      this.onPressed,
      this.size = kDefaultFabSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Positioned(
        left: MediaQuery.of(context).size.width / 2 - size / 2,
        bottom: kDefaultBottomNavbarHeight - 20,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size / 2),
              color: const Color(0xFFFC9D45).withOpacity(0.2)),
          child: Center(
            child: SizedBox.square(
              dimension: size * 0.8125,
              child: RawMaterialButton(
                fillColor: const Color(0xFFFC9D45),
                shape: const CircleBorder(),
                elevation: 0.0,
                onPressed: onPressed,
                child: Icon(iconData, color: eclipse, size: size / 2),
              ),
            ),
          ),
        ),
      );
}