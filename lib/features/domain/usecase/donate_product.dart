import 'package:ngo/core/resources/data_state.dart';
import 'package:ngo/core/usecases/usecase.dart';
import 'package:ngo/features/data/model/product.dart';
import 'package:ngo/features/data/remote/responses/verify_response.dart';
import 'package:ngo/features/domain/repository/ngo_repository.dart';

class DonateProductUseCase
    implements UseCase<DataState<VerifyResponse>, ProductModel> {
  final NGORepository _ngoRepository;
  DonateProductUseCase(this._ngoRepository);

  @override
  Future<DataState<VerifyResponse>> call({ProductModel? parms}) {
    return _ngoRepository.donateProduct(parms!);
  }
}
