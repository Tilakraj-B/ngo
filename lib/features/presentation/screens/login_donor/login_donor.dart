import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngo/features/presentation/bloc/login_donor/login_donor_bloc.dart';
import 'package:ngo/features/presentation/bloc/login_donor/login_donor_state.dart';
import 'package:ngo/features/presentation/widgets/large_button.dart';
import 'package:ngo/features/presentation/widgets/loading_widget.dart';

import '../../bloc/login_donor/login_donor_event.dart';
import '../../widgets/text_field.dart';

class LoginDonor extends StatelessWidget {
  const LoginDonor({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    return BlocBuilder<LoginDonorBloc, LoginDonorState>(
        builder: (context, state) {
      if (state is LoadingState) {
        return const LoadingWidget();
      }
      if (state is InitialState) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InputText(
                  label: "Donor E-mail",
                  hintText: "Donor E-mail",
                  onChanged: (value) => BlocProvider.of<LoginDonorBloc>(context)
                      .add(TextChangeEvent(value, 1)),
                ),
                InputText(
                  label: "Phone No.",
                  hintText: "Phone No.",
                  onChanged: (value) => BlocProvider.of<LoginDonorBloc>(context)
                      .add(TextChangeEvent(value, 2)),
                ),
                LargeButton(
                    label: "Login",
                    onPressed: () => BlocProvider.of<LoginDonorBloc>(context)
                        .add(LoginDonorSubmitted()))
              ],
            ),
          ),
        );
      }
      if (state is LoadingState) {
        return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text("Loading")],
        );
      }
      return const SizedBox();
    });
  }
}
