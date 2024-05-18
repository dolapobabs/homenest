import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:homenest/utils/app_colors.dart';

import '../../utils/app_assets.dart';
import '../widgets/image_tile.dart';

class GridTile {
  const GridTile(
      this.url, this.crossAxisCount, this.mainAxisCount, this.address);
  final int crossAxisCount;
  final int mainAxisCount;
  final String url;
  final String address;
}

class ImageGridView extends StatelessWidget {
  const ImageGridView({super.key});
  static const tiles = [
    GridTile(AppAssets.asset1, 4, 2, 'Gladkowa St,. 25'),
    GridTile(AppAssets.asset2, 2, 4, 'Gubina St,. 11'),
    GridTile(AppAssets.asset3, 2, 2, 'Trefoleva St,. 43'),
    GridTile(AppAssets.asset4, 2, 2, 'Sedova St,. 22'),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r), color: AppColors.white),
        child: StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 6,
          crossAxisSpacing: 6,
          children: List.generate(tiles.length, (int index) {
            return StaggeredGridTile.count(
              crossAxisCellCount: tiles[index].crossAxisCount,
              mainAxisCellCount: tiles[index].mainAxisCount,
              child: ImageTile(
                index: index,
                url: tiles[index].url,
                address: tiles[index].address,
              ),
            );
          }),
        ),
      ),
    );
  }
}
