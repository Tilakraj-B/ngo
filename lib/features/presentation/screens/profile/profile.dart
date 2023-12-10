import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngo/features/presentation/bloc/profile/profile_bloc.dart';
import 'package:ngo/features/presentation/bloc/profile/profile_event.dart';
import 'package:ngo/features/presentation/bloc/profile/profile_state.dart';
import 'package:ngo/features/presentation/widgets/loading_widget.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return Scaffold(
        body: _buildbody(context, state),
      );
    });
  }

  _buildbody(BuildContext context, ProfileState state) {
    if (state is InitializingState) {
      BlocProvider.of<ProfileBloc>(context).add(InitalizeDonorProfileEvent());
    }
    if (state is LoadingState) {
      return const LoadingWidget();
    }
    if (state is InitialState) {
      return Text("${state.donorModel}");
    }

    return SizedBox();
  }
}
