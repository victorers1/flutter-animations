import 'package:animations/extensions/string_extensions.dart';

mixin PageTitleMixin {
  /// Transforms a string in format '/page-name' to 'Page Name'
  String getPageTitle(String routeName) {
    return routeName
        .replaceAll('/', '')
        .replaceAll('-', ' ')
        .capitalizeEachWord;
  }
}
