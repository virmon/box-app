import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:box_app/src/constants/app_colors.dart';
import 'package:box_app/src/routing/app_router.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: goRouter,
      title: 'Flutter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: AppColors.whiteSmoke,
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.black,
          indicatorColor: Colors.white12,
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const TextStyle(color: AppColors.white);
            }
            return const TextStyle(color: AppColors.grey, fontSize: 12);
          }),
        ),
        navigationRailTheme: NavigationRailThemeData(
          backgroundColor: Colors.black,
          indicatorColor: Colors.white12,
          unselectedLabelTextStyle: TextStyle(color: AppColors.white),
          selectedLabelTextStyle: TextStyle(color: AppColors.white),
        ),
      ),
    );
  }
}
