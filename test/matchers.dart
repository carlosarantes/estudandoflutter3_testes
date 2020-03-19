import 'package:estudando_flutter2/screens/dashboard.dart';

bool featureItemMatcher(Widget widget, String name, IconData icon) {
  if(widget is FeatureItem) {
      return widget.name == name && widget.icon == icon;
  }
  return false;
}