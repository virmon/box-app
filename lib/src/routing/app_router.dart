import 'package:box_app/src/feature/products/presentation/add_product_form.dart';
import 'package:box_app/src/feature/products/presentation/products_screen.dart';
import 'package:box_app/src/feature/products/presentation/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:box_app/src/feature/authentication/auth_gate.dart';
import 'package:box_app/src/routing/app_navigation_bar.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorProductsKey = GlobalKey<NavigatorState>(
  debugLabel: 'shellProducts',
);
final _shellNavigatorSearchKey = GlobalKey<NavigatorState>(
  debugLabel: 'shellSearch',
);
final _shellNavigatorAddProductKey = GlobalKey<NavigatorState>(
  debugLabel: 'shellAddProduct',
);

enum AppRoute { signIn, products, search, addProducts }

final goRouterProvider = Provider((ref) {
  return GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: false,
    redirect: (context, state) {
      // final path = state.uri.path;
      // check loggedIn state here then redirect to proper path
      return null;
    },
    routes: [
      GoRoute(
        path: '/signIn',
        name: AppRoute.signIn.name,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: AuthGate()),
      ),
      StatefulShellRoute.indexedStack(
        pageBuilder: (context, state, navigationShell) => NoTransitionPage(
          child: AppNavigationBar(navigationShell: navigationShell),
        ),
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorProductsKey,
            routes: [
              GoRoute(
                path: '/',
                name: AppRoute.products.name,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: ProductsScreen()),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorSearchKey,
            routes: [
              GoRoute(
                path: '/search',
                name: AppRoute.search.name,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: SearchScreen()),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorAddProductKey,
            routes: [
              GoRoute(
                path: '/add',
                name: AppRoute.addProducts.name,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: AddProductForm()),
              ),
            ],
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) => const NoTransitionPage(
      child: Scaffold(body: Center(child: Text('Page Not Found'))),
    ),
  );
});
