import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngo/features/presentation/bloc/home/home_bloc.dart';
import 'package:ngo/features/presentation/bloc/home/home_state.dart';
import 'package:ngo/features/presentation/widgets/loading_widget.dart';
import 'package:ngo/features/presentation/widgets/product_card.dart';

import '../../bloc/home/home_event.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildbody(context),
    );
  }

  _buildbody(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is GetProductsDoneState) {
        return ListView.builder(
          itemCount: state.products!.length ?? 0,
          itemBuilder: (context, index) {
            return ProductCard(product: state.products![index]);
          },
        );
      }
      if (state is GetProductsState) {
        BlocProvider.of<HomeBloc>(context).add(GetProducts());
      }
      if (state is LoadingState) {
        return const LoadingWidget();
      }

      if (state is ErrorState) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text("${state.error}")],
        );
      }
      return const SizedBox(
        height: 20,
      );
    });
  }
}
