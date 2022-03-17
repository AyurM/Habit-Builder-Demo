import 'package:flutter/material.dart';
import 'package:habit_builder_demo/base/base_state.dart';
import 'package:habit_builder_demo/data/model/bottom_nav_data.dart';
import 'package:habit_builder_demo/res/colors/colors.dart';
import 'package:habit_builder_demo/res/theme/constants.dart';
import 'package:habit_builder_demo/res/views/app_loading_indicator.dart';
import 'package:habit_builder_demo/res/views/habit_app_bar.dart';
import 'package:habit_builder_demo/res/views/habit_bottom_navbar/habit_bottom_navbar.dart';
import 'package:habit_builder_demo/res/views/habit_list/habit_list.dart';
import 'package:habit_builder_demo/res/views/quote_view.dart';
import 'package:habit_builder_demo/res/views/user_avatar.dart';
import 'package:habit_builder_demo/screens/home/home_cubit.dart';
import 'package:habit_builder_demo/screens/new_habit/new_habit_page.dart';
import 'package:habit_builder_demo/utils/snackbar_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeCubit, HomeState> {
  @override
  Widget builder(BuildContext context, HomeState state) {
    const List<BottomNavData> navData = [
      BottomNavData(imagePath: 'assets/images/nav_home.png'),
      BottomNavData(imagePath: 'assets/images/nav_courses.png'),
      BottomNavData(imagePath: 'assets/images/nav_community.png'),
      BottomNavData(imagePath: 'assets/images/nav_settings.png'),
    ];

    return WillPopScope(
      onWillPop: cubit.onBackPressed,
      child: Scaffold(
          appBar: HabitAppBar(
            context: context,
            text: cubit.pageTitle,
            leadingIcon: _getAppBarLeadingIcon(state),
            onLeadingPressed: cubit.onAppBarLeadingPressed,
            trailing: _buildAppBarTrailing(state),
          ),
          body: Stack(
            children: [
              const _HomePageBackground(),
              _buildScaffoldBody(state),
              if (state is! HomeLoading)
                _HomeFab(
                    assetPath: state is HomeAddNewHabitPressed
                        ? 'assets/images/check.png'
                        : 'assets/images/plus.png',
                    onPressed: cubit.onFabPressed)
            ],
          ),
          resizeToAvoidBottomInset: false,
          extendBody: true,
          bottomNavigationBar: const HabitBottomNavBar(navData: navData)),
    );
  }

  Widget _buildScaffoldBody(HomeState state) {
    if (state is HomeLoading) {
      return const AppLoadingIndicator();
    }

    if (state is HomeAddNewHabitPressed) {
      return NewHabitPage(
          formKey: cubit.formKey, controller: cubit.habitNameController);
    }

    return Column(children: [
      Padding(
        padding: EdgeInsets.all(kDefaultHorizontalPaddingMedium.left),
        child: QuoteView(quote: cubit.quote),
      ),
      HabitList(habits: cubit.habits),
    ]);
  }

  Widget? _buildAppBarTrailing(HomeState state) {
    if (state is HomeAddNewHabitPressed) {
      return null;
    }

    return UserAvatar(
        backgroundColor: Colors.grey,
        imageUrl: 'https://randomuser.me/api/portraits/men/97.jpg',
        radius: kDefaultIconButtonSize / 2,
        onPressed: cubit.onProfilePressed);
  }

  IconData _getAppBarLeadingIcon(HomeState state) {
    if (state is HomeAddNewHabitPressed) {
      return Icons.arrow_back;
    }

    return Icons.menu;
  }

  @override
  void listener(BuildContext context, HomeState state) {
    if (state is HomeError) {
      context.showSnackBar('Error: ${state.message}', clear: true);
    }

    if (state is HomeNewHabitAdded) {
      context.showSnackBar('Habit: ${state.name}', clear: true);
    }
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
  final String assetPath;
  final double size;
  final void Function()? onPressed;

  const _HomeFab(
      {Key? key,
      required this.assetPath,
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
                child: Image.asset(assetPath,
                    width: size / 3, height: size / 3, color: eclipse),
              ),
            ),
          ),
        ),
      );
}
