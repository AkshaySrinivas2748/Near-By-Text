import 'package:flutter/cupertino.dart';

extension SizedBoxSpacing on double {
  Widget get height => SizedBox(height: this);
  Widget get width => SizedBox(width: this);
}
