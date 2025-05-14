import 'package:flutter_assignment/core/utils/app_screen.dart';
import 'package:flutter_assignment/features/add_product/presentation/pages/add_product.dart';
import 'package:flutter_assignment/features/cart/presentation/pages/cart_page.dart';
import 'package:flutter_assignment/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:flutter_assignment/features/home/presentation/pages/home_page.dart';
import 'package:flutter_assignment/features/login/presentation/pages/login_page.dart';
import 'package:flutter_assignment/features/product_details/presentation/pages/product_details.dart';
import 'package:flutter_assignment/features/product_list/presentation/pages/product_list_page.dart';
import 'package:flutter_assignment/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter_assignment/features/signup/presentation/pages/signup_page.dart';
import 'package:flutter_assignment/features/splash/presentation/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: AppScreen.splashPath,
  routes: [
    GoRoute(
      path: AppScreen.splashPath,
      builder: (context, state) => SplashPage(),
    ),
    GoRoute(
      path: AppScreen.loginPath,
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: AppScreen.signUpPath,
      builder: (context, state) => SignupPage(),
    ),
    GoRoute(
      path: AppScreen.productDetailPath,
      builder:
          (context, state) => ProductDetails(
            productID: state.pathParameters['productId'] ?? "",
          ),
    ),

    StatefulShellRoute.indexedStack(
      builder:
          (context, state, navigationShell) =>
              DashboardPage(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppScreen.homePath,
              builder: (context, state) => HomePage(),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppScreen.productsPath,
              builder: (context, state) => ProductListPage(),
              routes: [
                GoRoute(
                  path: AppScreen.addProductPath,
                  name: AppScreen.addProduct,
                  builder: (context, state) => AddProduct(),
                ),
                GoRoute(
                  path: AppScreen.productDetailPath,
                  name: AppScreen.productDetail,
                  builder:
                      (context, state) => ProductDetails(
                        productID: state.pathParameters['productId'] ?? "",
                      ),
                ),
              ],
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppScreen.profilePath,
              builder: (context, state) => ProfilePage(),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppScreen.cartPath,
              builder: (context, state) => CartPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
