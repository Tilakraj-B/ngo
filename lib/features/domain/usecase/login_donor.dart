import 'package:ngo/core/resources/data_state.dart';
import 'package:ngo/core/usecases/usecase.dart';
import 'package:ngo/features/data/model/donor.dart';
import 'package:ngo/features/data/remote/responses/auth_response.dart';
import 'package:ngo/features/domain/repository/ngo_repository.dart';

class LoginDonorUseCase
    implements UseCase<DataState<AuthResponse>, DonorModel> {
  final NGORepository _ngoRepository;

  LoginDonorUseCase(this._ngoRepository);

  @override
  Future<DataState<AuthResponse>> call({DonorModel? parms}) {
    return _ngoRepository.loginDonor(parms!);
  }
}
