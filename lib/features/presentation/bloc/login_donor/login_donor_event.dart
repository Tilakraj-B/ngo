abstract class LoginDonorEvent {}

class TextChangeEvent extends LoginDonorEvent {
  final String value;
  final int flag;
  TextChangeEvent(this.value, this.flag);
}

class RegisterDonorSubmittedEvent extends LoginDonorEvent {}
