import 'package:flutter/material.dart';
import 'package:authentication/app/ui/themes/my_colors.dart';

class CommonScaffold extends StatelessWidget {
  final Widget? child;
final PreferredSizeWidget? appBar;
final Color? backgroundColor;
final bool? resetBottom;
  const CommonScaffold({Key? key,this.backgroundColor,this.resetBottom,this.appBar,this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resetBottom,
      backgroundColor: backgroundColor,
      appBar: appBar,
      body: child,
    );
  }
}
