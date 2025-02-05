import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokecompanion/components/loading_widget.dart';

class PNetworkImages extends StatelessWidget {
  const PNetworkImages({super.key, required this.imageUrl, this.height});

  final String imageUrl;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      fit: BoxFit.cover,
      placeholder: (context, url) => PLoadingWidget(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
