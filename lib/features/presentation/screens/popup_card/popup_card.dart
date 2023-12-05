import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngo/features/presentation/bloc/popup_card/popup_card_bloc.dart';
import 'package:ngo/features/presentation/bloc/popup_card/popup_card_event.dart';
import 'package:ngo/features/presentation/bloc/popup_card/popup_card_state.dart';

class PopUpCard extends StatelessWidget {
  final String State;
  const PopUpCard({required this.State, super.key});

  @override
  Widget build(BuildContext context) {
    PopUpCardState initialState = NotLoggedInState();
    if (State == "LoggedIn") {
      initialState = LoggedInState();
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildbody(context, initialState),
    );
  }

  _buildbody(BuildContext context, PopUpCardState initialState) {
    return BlocProvider(
      create: (context) => PopUpCardBloc(initial_state: initialState),
      child: BlocBuilder<PopUpCardBloc, PopUpCardState>(
        builder: (context, state) {
          if (state is LoggedInState) {
            return Center(
              child: Container(
                height: 240,
                margin: EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: Center(
                  child: SizedBox.expand(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FilledButton(
                        onPressed: () {},
                        child: Text("Profile"),
                      ),
                      FilledButton(
                        onPressed: () {},
                        child: Text("Donate"),
                      ),
                      FilledButton(
                        onPressed: () {
                          BlocProvider.of<PopUpCardBloc>(context)
                              .add(LogOutEvent());
                          Navigator.pop(context);
                        },
                        child: Text("Log Out"),
                      ),
                    ],
                  )),
                ),
              ),
            );
          }
          if (state is NotLoggedInState) {
            return Center(
              child: Container(
                height: 300,
                margin: EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: Center(
                  child: SizedBox(
                    child: FilledButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login_donor');
                      },
                      child: Text("Donate"),
                    ),
                  ),
                ),
              ),
            );
          }
          return const SizedBox(
            height: 10,
          );
        },
      ),
    );
  }
}
