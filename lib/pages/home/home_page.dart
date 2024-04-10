import 'package:animations/pages/durations/md3_durations_page.dart';
import 'package:animations/pages/rotations/rotations_page.dart';
import 'package:animations/pages/chained_animations/chained_animations_page.dart';
import 'package:animations/pages/curves/curves_page.dart';
import 'package:animations/pages/home/widgets/list_item_widget.dart';
import 'package:animations/mixins/page_title_from_route_name_mixin.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget with PageTitleMixin {
  static const String routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListItemWidget(
              title: getPageTitle(RotationsPage.routeName),
              onTap: () => Navigator.of(context).pushNamed(
                RotationsPage.routeName,
              ),
            ),
            ListItemWidget(
              title: getPageTitle(CurvesPage.routeName),
              onTap: () => Navigator.of(context).pushNamed(
                CurvesPage.routeName,
              ),
            ),
            ListItemWidget(
              title: getPageTitle(ChainedAnimationsPage.routeName),
              onTap: () => Navigator.of(context).pushNamed(
                ChainedAnimationsPage.routeName,
              ),
            ),
            ListItemWidget(
              title: getPageTitle(MD3DurationsPage.routeName),
              onTap: () => Navigator.of(context).pushNamed(
                MD3DurationsPage.routeName,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
