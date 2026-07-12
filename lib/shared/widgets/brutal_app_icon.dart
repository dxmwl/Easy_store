import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../config/brutal_theme.dart';

class BrutalAppIcon extends StatelessWidget {
  final String? imageUrl;
  final double size;
  final IconData fallbackIcon;

  const BrutalAppIcon({
    super.key,
    this.imageUrl,
    this.size = 48,
    this.fallbackIcon = Icons.apps,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: BrutalTheme.surface,
        border: Border.all(color: BrutalTheme.ink, width: 2),
        borderRadius: BorderRadius.circular(BrutalTheme.radius),
      ),
      child: imageUrl != null && imageUrl!.isNotEmpty
          ? ClipRRect(
              borderRadius: BorderRadius.circular(BrutalTheme.radius),
              child: CachedNetworkImage(
                imageUrl: imageUrl!,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: Icon(
                    fallbackIcon,
                    color: BrutalTheme.ink,
                    size: size * 0.5,
                  ),
                ),
                errorWidget: (context, url, error) => Center(
                  child: Icon(
                    fallbackIcon,
                    color: BrutalTheme.ink,
                    size: size * 0.5,
                  ),
                ),
              ),
            )
          : Center(
              child: Icon(
                fallbackIcon,
                color: BrutalTheme.ink,
                size: size * 0.5,
              ),
            ),
    );
  }
}
