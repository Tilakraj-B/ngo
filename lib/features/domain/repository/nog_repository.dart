import 'package:ngo/features/data/model/donor.dart';
import 'package:ngo/features/data/model/product.dart';
import 'package:ngo/features/data/remote/auth_response.dart';
import 'package:ngo/features/data/remote/verify_response.dart';

import '../../../core/resources/data_state.dart';

abstract class NGORepository {
  Future<DataState<List<ProductModel>>> getAllProducts();

  Future<DataState<AuthResponse>> registerDonor(DonorModel donorModel);

  Future<DataState<AuthResponse>> loginDonor(DonorModel donorModel);

  Future<DataState<VerifyResponse>> verifyDonor(String token);
}
