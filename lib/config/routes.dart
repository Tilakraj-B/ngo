import 'package:flutter/material.dart';
import 'package:ngo/features/presentation/screens/register_donor/register_donor.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(RegisterDonor());

      default:
        return _materialRoute(RegisterDonor());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
