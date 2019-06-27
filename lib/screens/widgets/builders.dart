import 'package:flutter/widgets.dart';

Widget buildVisibleWidget(Widget widget, bool visible) => Visibility(
      visible: visible,
      child: widget,
    );
