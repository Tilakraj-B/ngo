import 'package:flutter/material.dart';
import 'package:ngo/features/presentation/screens/login_donor/login_donor.dart';
import 'package:ngo/features/presentation/screens/register_donor/register_donor.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/register_donor':
        return _materialRoute(RegisterDonor());
      case '/login_donor':
        return _materialRoute(LoginDonor());

      default:
        return _materialRoute(RegisterDonor());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
