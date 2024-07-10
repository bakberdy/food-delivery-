import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:badges/badges.dart' as badges;
import 'package:food_ninja/src/presentation/blocs/navigation_bar_bloc/navigation_bar_bloc.dart';
import 'package:food_ninja/src/presentation/screens/main/pages/home_page/home_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Widget> pages = [
    const HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationBarBloc>(
      create: (BuildContext context) => NavigationBarBloc(),
      child: BlocConsumer<NavigationBarBloc, NavigationBarState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 1.5,
                          child: Image.asset(
                              fit: BoxFit.cover,
                              "assets/images/home_bg_pattern.png"))),
                  pages[state.tabIndex],
                  Positioned(
                      bottom: 20,
                      left: 20,
                      right: 20,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.r),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          color: Theme
                              .of(context)
                              .canvasColor,
                          width: double.infinity,
                          height: 80.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              NavigationBarItem(
                                isSelected: state.tabIndex == 0,
                                title: 'Home',
                                iconPath: 'assets/icons/home.png',
                                onTap: () {
                                  BlocProvider.of<NavigationBarBloc>(context)
                                      .add(TabChange(tabIndex: 0));
                                },
                              ),
                              NavigationBarItem(
                                badgeContent: "2",
                                isSelected: state.tabIndex == 1,
                                title: 'Profile',
                                iconPath: 'assets/icons/Icon Profile.png',
                                onTap: () {
                                  BlocProvider.of<NavigationBarBloc>(context)
                                      .add(TabChange(tabIndex: 1));
                                },
                              ),
                              NavigationBarItem(
                                isSelected: state.tabIndex == 2,
                                title: 'Cart',
                                iconPath: 'assets/icons/Buy.png',
                                onTap: () {
                                  BlocProvider.of<NavigationBarBloc>(context)
                                      .add(TabChange(tabIndex: 2));
                                },
                              ),
                              NavigationBarItem(
                                isSelected: state.tabIndex == 3,
                                title: 'Chat',
                                iconPath: 'assets/icons/Chat.png',
                                onTap: () {
                                  BlocProvider.of<NavigationBarBloc>(context)
                                      .add(TabChange(tabIndex: 3));
                                },
                              ),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ),
          );
        },
        listener: (BuildContext context, NavigationBarState state) {},
      ),
    );
  }
}

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({super.key,
    required this.isSelected,
    required this.title,
    required this.iconPath,
    this.badgeContent,
    required this.onTap});

  final bool isSelected;
  final String title;
  final String iconPath;
  final String? badgeContent;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: AnimatedContainer(
          height: 50.h,
          width: isSelected ? 105.w : 50.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected
                ? Theme
                .of(context)
                .cardColor
                .withOpacity(0.1)
                : Colors.transparent,
            borderRadius: isSelected
                ? BorderRadius.circular(12.r)
                : BorderRadius.circular(12.r),
          ),
          duration: const Duration(milliseconds: 150),
          child: badges.Badge(
              badgeStyle: const badges.BadgeStyle(
                shape: badges.BadgeShape.circle,
                badgeColor: Colors.red,
                elevation: 0,
              ),
              showBadge: badgeContent != null,
              position: badges.BadgePosition.topEnd(top: -18.h, end: 0),
              badgeContent: Text(badgeContent ?? ""),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Image.asset(
                iconPath,
                color: isSelected
                    ? Theme
                    .of(context)
                    .cardColor
                    : Theme
                    .of(context)
                    .cardColor
                    .withOpacity(0.9),
              ),
              isSelected
                  ? SizedBox(
                width: 10.w,
              )
                  : const SizedBox(),
              AnimatedSwitcher(
                  duration: const Duration(milliseconds: 150),
                  child: isSelected?
                  FutureBuilder(
                  future: Future.delayed(const Duration(milliseconds: 150)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Theme
                      .of(context)
                      .primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        )
            :
        const SizedBox())
    ],
    )),
    ),
    );
    }
}
