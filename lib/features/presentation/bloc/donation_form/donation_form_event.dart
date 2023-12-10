abstract class DonationFormEvent {}

class TextChangeEvent extends DonationFormEvent {
  final String value;
  final int flag;
  TextChangeEvent(this.value, this.flag);
}

class LoginDonorSubmitted extends DonationFormEvent {}
