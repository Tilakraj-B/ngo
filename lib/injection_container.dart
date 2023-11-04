import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ngo/features/data/remote/ngo_api_service.dart';
import 'package:ngo/features/data/repository/ngo_repository_impl.dart';
import 'package:ngo/features/domain/repository/nog_repository.dart';
import 'package:ngo/features/domain/usecase/get_products.dart';
import 'package:ngo/features/domain/usecase/register_donor.dart';
import 'package:ngo/features/domain/usecase/verify_donor.dart';
import 'package:ngo/features/presentation/bloc/home/home_bloc.dart';
import 'package:ngo/features/presentation/bloc/login_donor/login_donor_bloc.dart';
import 'package:ngo/features/presentation/bloc/register_donor/register_donor_bloc.dart';

final sl = GetIt.instance;

Future<void> initalizeDependencies() async {
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<NGOApiService>(NGOApiService(sl()));

  sl.registerSingleton<NGORepository>(NGORepositoryImpl(sl()));

  sl.registerSingleton<GetProductUseCase>(GetProductUseCase(sl()));
  sl.registerSingleton<RegisterDonorUseCase>(RegisterDonorUseCase(sl()));
  sl.registerSingleton<VerifyDonorUseCase>(VerifyDonorUseCase(sl()));

  sl.registerSingleton<RegisterDonorBloc>(RegisterDonorBloc(sl()));
  sl.registerFactory(() => (LoginDonorBloc(sl())));
  sl.registerSingleton(HomeBloc(sl()));
}
