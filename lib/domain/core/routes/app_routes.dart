import 'package:get/get.dart';
import 'package:moderncreditapp/application/presentation/home/home_screen.dart';
import '../../../application/presentation/bottom_nav/bottom_nav_screen.dart';
import '../../../application/presentation/creditors/creditors_screen.dart';
import '../../../application/presentation/reports/reports_screeen.dart';
import '../../../application/presentation/transactions/transactions_screen.dart';

class AppRoutes {
  static const String bottomNav = '/';
  static const String home = '/home';
  static const String creditors = '/creditors';
  static const String reports = '/reports';
  static const String transactions = '/transactions';

  static List<GetPage> pages = [
    GetPage(name: bottomNav, page: () => BottomNavScreen()),
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: creditors, page: () => CreditorsScreen()),
    GetPage(name: reports, page: () => const ReportsScreeen()),
    GetPage(name: transactions, page: () => TransactionsScreen()),
  ];
}
