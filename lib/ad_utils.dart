library ad_utils;

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

/// A widget that displays a grid view with advertisements at specific intervals.
///
/// The [AdUtils] widget is designed to display a grid view of items with advertisements inserted
/// at regular intervals or custom positions. It supports three types of grid layouts: [AdUtilsType.once],
/// [AdUtilsType.repeated], and [AdUtilsType.custom].
enum AdUtilsType { once, repeated, custom }

///
/// The [padding], [physics], [controller], [customAdIndex], [itemMainAspectRatio] parameters
/// allow further customization of the grid view.
class AdUtils extends StatelessWidget {
  /// Creates a [AdUtils] widget.
  ///
  /// The [crossAxisCount] parameter specifies the number of items in each row.
  ///
  /// The [itemCount] parameter specifies the total number of items in the grid.
  ///
  /// The [adIndex] parameter specifies the position where advertisements should be inserted.
  ///
  /// The [adWidget] parameter is the widget to be displayed as an advertisement.
  ///
  /// The [itemWidget] parameter is a callback function that builds the widgets for grid items.
  ///
  /// The [adUtilsType] parameter specifies the type of grid layout to use:
  ///   - [AdUtilsType.once] adds a single advertisement at the specified index.
  ///   - [AdUtilsType.repeated] adds advertisements at regular intervals.
  ///   - [AdUtilsType.custom] allows customizing the positions of advertisements.
  const AdUtils({
    this.padding,
    this.physics,
    this.controller,
    this.customAdIndex = const [],
    this.itemMainAspectRatio = 1,
    required this.crossAxisCount,
    required this.itemCount,
    required this.adIndex,
    required this.adWidget,
    required this.itemWidget,
    this.adUtilsType = AdUtilsType.once,
    Key? key,
  }) : super(key: key);

  final List customAdIndex;
  final ScrollController? controller;
  final AdUtilsType adUtilsType;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;
  final double? itemMainAspectRatio;
  final int crossAxisCount;
  final int itemCount;
  final int adIndex;
  final Widget adWidget;
  final Widget Function(BuildContext context, int index) itemWidget;

  @override
  Widget build(BuildContext context) {
    /// for Once
    int _itemCount = 0;
    if (itemCount < (crossAxisCount * adIndex)) {
      _itemCount = itemCount;
    } else {
      _itemCount = itemCount + 1;
    }

    List indexList = [];
    if (AdUtilsType.repeated == adUtilsType) {
      /// for Repeated
      int j = 0;
      for (int i = 0; i < itemCount; i++) {
        j++;
        indexList.add(i);
        if (j == adIndex * crossAxisCount) {
          indexList.add("ad");
          j = 0;
        }
      }
    } else if (AdUtilsType.custom == adUtilsType) {
      /// for Custom
      if (customAdIndex.isEmpty) {
        throw Exception(
            'You are using AdUtilsType.custom so provide a List<index> in customAdIndex parameter');
      }
      List _customAdIndex = customAdIndex;
      int j = 0;
      for (int i = 0; i < itemCount; i++) {
        if (i % crossAxisCount == 0) {
          j = i ~/ crossAxisCount;
          if (_customAdIndex.contains(j)) {
            _customAdIndex.remove(j);
            indexList.add("ad");
          }
        }
        indexList.add(i);
      }
    }

    return AdUtilsType.once == adUtilsType
        ? SingleChildScrollView(
            controller: controller,
            physics: physics,
            padding: padding,
            child: StaggeredGrid.count(
              crossAxisCount: crossAxisCount,
              children: List.generate(
                _itemCount,
                (index) {
                  return index == (crossAxisCount * adIndex)
                      ? StaggeredGridTile.fit(
                          crossAxisCellCount: crossAxisCount, child: adWidget)
                      : StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: itemMainAspectRatio! * 1,
                          child: itemWidget(
                              context,
                              index < (crossAxisCount * adIndex)
                                  ? index
                                  : (index - 1)),
                        );
                },
              ),
            ),
          )
        : SingleChildScrollView(
            controller: controller,
            physics: physics,
            padding: padding,
            child: StaggeredGrid.count(
              crossAxisCount: crossAxisCount,
              children: List.generate(
                indexList.length,
                (index) {
                  return indexList[index] == "ad"
                      ? StaggeredGridTile.fit(
                          crossAxisCellCount: crossAxisCount, child: adWidget)
                      : StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: itemMainAspectRatio! * 1,
                          child: itemWidget(context, indexList[index]),
                        );
                },
              ),
            ),
          );
  }
}
