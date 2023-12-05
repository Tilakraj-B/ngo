import 'package:flutter/material.dart';
import 'package:ngo/features/data/model/picture.dart';

class ImageListApp extends StatefulWidget {
  final List<PictureModel>? imageUrls;
  final double width;
  final double height;

  const ImageListApp(
      {Key? key,
      required this.imageUrls,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  State<ImageListApp> createState() => _ImageListAppState();
}

class _ImageListAppState extends State<ImageListApp> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  void _onLeftButtonClick() {
    setState(() {
      _currentIndex = _currentIndex > 0 ? _currentIndex - 1 : 0;
    });
  }

  void _onRightButtonClick() {
    setState(() {
      _currentIndex = _currentIndex < widget.imageUrls!.length - 1
          ? _currentIndex + 1
          : widget.imageUrls!.length - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_left),
          onPressed: _onLeftButtonClick,
        ),
        Image.network(
          widget.imageUrls![_currentIndex].url!,
          width: widget.width,
          height: widget.height,
        ),
        IconButton(
          icon: const Icon(Icons.arrow_right),
          onPressed: _onRightButtonClick,
        ),
      ],
    );
  }
}
