import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngo/features/presentation/bloc/register_donor/register_donor_bloc.dart';
import 'package:ngo/features/presentation/bloc/register_donor/register_donor_event.dart';
import 'package:ngo/features/presentation/bloc/register_donor/register_donor_state.dart';
import 'package:ngo/features/presentation/widgets/LargeButton.dart';

import '../../widgets/text_field.dart';

class RegisterDonor extends StatelessWidget {
  const RegisterDonor({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    return BlocBuilder<RegisterDonorBloc, RegisterDonorState>(
        builder: (context, state) {
      bool? isChecked = false;
      if (state is InitialState) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InputText(
              label: "Donor Name",
              hintText: "Donor Name",
              onChanged: (value) => BlocProvider.of<RegisterDonorBloc>(context)
                  .add(TextChangeEvent(value, 1)),
            ),
            InputText(
              label: "Phone No.",
              hintText: "Phone No.",
              onChanged: (value) => BlocProvider.of<RegisterDonorBloc>(context)
                  .add(TextChangeEvent(value, 2)),
            ),
            InputText(
              label: "Donor Address",
              hintText: "Donor Address",
              onChanged: (value) => BlocProvider.of<RegisterDonorBloc>(context)
                  .add(TextChangeEvent(value, 3)),
            ),
            InputText(
              label: "Donor Email",
              hintText: "Donor Email",
              onChanged: (value) => BlocProvider.of<RegisterDonorBloc>(context)
                  .add(TextChangeEvent(value, 2)),
            ),
            InputText(
              label: "Donor Id Type",
              hintText: "Donor Id Type",
              onChanged: (value) => BlocProvider.of<RegisterDonorBloc>(context)
                  .add(TextChangeEvent(value, 2)),
            ),
            InputText(
              label: "Donor Id No.",
              hintText: "Donor Id No.",
              onChanged: (value) => BlocProvider.of<RegisterDonorBloc>(context)
                  .add(TextChangeEvent(value, 2)),
            ),
            InputText(
              label: "Donor PAN No.",
              hintText: "Donor PAN No.",
              onChanged: (value) => BlocProvider.of<RegisterDonorBloc>(context)
                  .add(TextChangeEvent(value, 2)),
            ),
            LargeButton(
                label: "Register",
                onPressed: () => BlocProvider.of<RegisterDonorBloc>(context)
                    .add(RegisterDonorSubmittedEvent()))
          ],
        );
      }
      return const SizedBox();
    });
  }
}
