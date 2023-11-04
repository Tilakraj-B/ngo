import 'package:ngo/core/resources/data_state.dart';
import 'package:ngo/core/usecases/usecase.dart';
import 'package:ngo/features/data/model/donor.dart';
import 'package:ngo/features/data/remote/auth_response.dart';
import 'package:ngo/features/domain/repository/nog_repository.dart';

class VerifyDonorUseCase
    implements UseCase<DataState<AuthResponse>, DonorModel> {
  final NGORepository _ngoRepository;

  VerifyDonorUseCase(this._ngoRepository);

  @override
  Future<DataState<AuthResponse>> call({DonorModel? parms}) {
    return _ngoRepository.verifyDonor(parms!);
  }
}
