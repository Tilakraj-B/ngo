import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import '../../data/model/picture.dart';

class ScrollSnapImageView extends StatefulWidget {
  List<PictureModel>? imageUrl;
  double width;
  double height;
  ScrollSnapImageView(
      {Key? key,
      required this.imageUrl,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  _ScrollSnapImageViewState createState() => _ScrollSnapImageViewState();
}

class _ScrollSnapImageViewState extends State<ScrollSnapImageView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widget.height,
        width: MediaQuery.of(context).size.width,
        child: ScrollSnapList(
          itemBuilder: _buildListItem,
          itemCount: widget.imageUrl?.length ?? 1,
          itemSize: 150,
          onItemFocus: (index) {},
          dynamicItemSize: true,
        ));
  }

  Widget _buildListItem(BuildContext context, int index) {
    String url =
        widget.imageUrl?[index].url ?? "//paste the image for no image";
    return SizedBox(
      child: Card(
        elevation: 12,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Column(
            children: [
              Image.network(
                url,
                fit: BoxFit.fill,
                height: widget.height - 10,
                width: widget.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
