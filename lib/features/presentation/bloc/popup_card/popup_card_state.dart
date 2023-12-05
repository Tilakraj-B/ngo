import 'package:equatable/equatable.dart';

abstract class PopUpCardState extends Equatable {
  String? errormessage;

  PopUpCardState({this.errormessage});

  @override
  List<Object?> get props => [errormessage];
}

class LoggedInState extends PopUpCardState {
  LoggedInState();
}

class NotLoggedInState extends PopUpCardState {
  NotLoggedInState();
}
