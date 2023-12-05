import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ngo/features/presentation/bloc/popup_card/popup_card_event.dart';
import 'package:ngo/features/presentation/bloc/popup_card/popup_card_state.dart';

class PopUpCardBloc extends Bloc<PopUpCardEvent, PopUpCardState> {
  final PopUpCardState initial_state;
  final storage = const FlutterSecureStorage();

  PopUpCardBloc({required this.initial_state}) : super(initial_state) {
    on<LogOutEvent>(onLogOut);
  }

  void onLogOut(LogOutEvent logOutEvent, Emitter<PopUpCardState> emit) {
    storage.write(key: 'loginToken', value: "null");
  }
}
