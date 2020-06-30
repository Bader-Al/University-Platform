import 'package:flutter/material.dart';

import 'package:psu_platform/pages/homeWidgets/AcademicPageWidgets/colorCategoryHeader.dart';
import 'package:psu_platform/pages/homeWidgets/SharedWidgets/draggableBottomSheet.dart';
import 'package:provider/provider.dart';
import 'package:psu_platform/pages/StudentHome/academicsPage.dart';

class AcademicDraggableSheet extends StatelessWidget {
  AcademicDraggableSheet(
      {this.children, this.title, this.header, this.pageIndex});
  final List children;
  final String title;
  final Widget header;
  final int pageIndex;
  @override
  Widget build(BuildContext context) {
    final _academicPageState = Provider.of<AcademicPageState>(context);
    return Container(
      key: ValueKey(pageIndex),
      child: NotificationListener(
        onNotification: (notification) {
          if (notification is DraggableScrollableNotification) {
            _academicPageState.updateExtent(notification.extent);
            // print(notification.initialExtent);
            // print(notification.maxExtent);
            // print(notification.extent);
          }
        },
        child: DraggableBottomSheet(
          headerWidget: header ?? ColorBasedTabs(),
          pageContent: children,
          pageIndex: 0,
          title: title,
        ),
      ),
    );
  }
}
