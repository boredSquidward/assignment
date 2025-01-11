import 'package:flutter/material.dart';

import '../screens/admin_home_screen.dart';
import '../screens/dashboard_account.dart';
import '../screens/enum/screens.dart';
import '../screens/login_page.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  Screens.adminHomePage.path: (context) => const AdminHomePage(),
  Screens.dashboardAccountPage.path: (context) => const DashboardAccount(),
  Screens.login.path: (context) => const LoginPage(),
};
