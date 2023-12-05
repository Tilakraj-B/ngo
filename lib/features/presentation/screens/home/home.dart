import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngo/features/data/model/product.dart';
import 'package:ngo/features/presentation/bloc/home/home_bloc.dart';
import 'package:ngo/features/presentation/bloc/home/home_state.dart';
import 'package:ngo/features/presentation/widgets/loading_widget.dart';
import 'package:ngo/features/presentation/widgets/product_card.dart';
import 'package:ngo/features/presentation/widgets/scroll_snap_list_view.dart';

import '../../bloc/home/home_event.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Scaffold(
        appBar: state.isLoggedIn == true
            ? _buildAppBar(context, true)
            : _buildAppBar(context, false),
        body: _buildbody(context, state),
      );
    });
  }

  _buildbody(BuildContext context, HomeState state) {
    if (state is GetProductsDoneState) {
      return ListView.builder(
        itemCount: state.products!.length ?? 0,
        itemBuilder: (context, index) {
          return ProductCard(
            product: state.products![index],
            onPressed: () {
              BlocProvider.of<HomeBloc>(context)
                  .add(DisplayProductEvent(index));
            },
          );
        },
      );
    }
    if (state is GetProductsState) {
      BlocProvider.of<HomeBloc>(context).add(GetProductsEvent());
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
    if (state is ProductDetailsState) {
      return _displayproduct(context, state.index!, state);
    }

    return const SizedBox(
      height: 20,
    );
  }
}

_displayproduct(BuildContext context, int index, HomeState state) {
  ProductModel product = state.products![index];
  return SafeArea(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ScrollSnapImageView(
            width: 200, height: 200, imageUrl: product.product_pictures_before),
        SizedBox(
          height: 10,
        ),
        Text(product.product_title ?? "Title not available"),
        SizedBox(
          height: 10,
        ),
        Text(product.product_description_before ?? "Description not available"),
        SizedBox(
          height: 10,
        ),
        Text(product.product_defects_before ?? "Defects not available"),
        SizedBox(
          height: 10,
        ),
        Text(product.product_area_of_donation ??
            "Area of donation not available"),
        SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}

_buildAppBar(BuildContext context, bool isLoggedIn) {
  return AppBar(
    title: Text("Home"),
    centerTitle: true,
    actions: [
      IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/popup_card',
                    arguments: isLoggedIn == true ? "LoggedIn" : "NotLoggedIn")
                .then((value) =>
                    BlocProvider.of<HomeBloc>(context).add(GetProductsEvent()));
          },
          icon: Icon(Icons.list))
    ],
  );
}
