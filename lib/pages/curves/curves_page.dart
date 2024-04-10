import 'package:animations/mixins/page_title_from_route_name_mixin.dart';
import 'package:flutter/material.dart';

class CurvesPage extends StatefulWidget {
  static const String routeName = '/curves';
  const CurvesPage({super.key});

  @override
  State<CurvesPage> createState() => _CurvesPageState();
}

class _CurvesPageState extends State<CurvesPage> with PageTitleMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(getPageTitle(CurvesPage.routeName))),
      body: const Placeholder(),
    );
  }
}
