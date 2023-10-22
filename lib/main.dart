import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngo/config/routes.dart';
import 'package:ngo/features/presentation/bloc/register_donor/register_donor_bloc.dart';
import 'package:ngo/features/presentation/screens/register_donor/register_donor.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterDonorBloc(),
      child: const MaterialApp(
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home: RegisterDonor(),
      ),
    );
  }
}
