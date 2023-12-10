import 'package:ngo/features/data/model/donor.dart';
import 'package:ngo/features/data/model/product.dart';
import 'package:ngo/features/data/remote/responses/auth_response.dart';
import 'package:ngo/features/data/remote/responses/verify_response.dart';

import '../../../core/resources/data_state.dart';

abstract class NGORepository {
  Future<DataState<List<ProductModel>>> getAllProducts();

  Future<DataState<AuthResponse>> registerDonor(DonorModel donorModel);

  Future<DataState<AuthResponse>> loginDonor(DonorModel donorModel);

  Future<DataState<VerifyResponse>> verifyDonor(String token);

  Future<DataState<VerifyResponse>> donateProduct(ProductModel productModel);
}
