import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngo/config/routes.dart';
import 'package:ngo/features/presentation/bloc/login_donor/login_donor_bloc.dart';
import 'package:ngo/features/presentation/bloc/register_donor/register_donor_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterDonorBloc()),
        BlocProvider(create: (context) => LoginDonorBloc()),
      ],
      child: const MaterialApp(
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        initialRoute: '/login_donor',
      ),
    );
  }
}
