import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngo/config/routes.dart';
import 'package:ngo/features/presentation/bloc/home/home_bloc.dart';
import 'package:ngo/features/presentation/bloc/login_donor/login_donor_bloc.dart';
import 'package:ngo/features/presentation/bloc/register_donor/register_donor_bloc.dart';
import 'package:ngo/injection_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initalizeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterDonorBloc(sl())),
        BlocProvider(create: (context) => LoginDonorBloc(sl())),
        BlocProvider(create: (context) => HomeBloc(sl()))
      ],
      child: const MaterialApp(
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        initialRoute: '/home',
      ),
    );
  }
}
