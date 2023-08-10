import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool centerTitle;
  final List<Widget>? actions;
  final Color? color;
  final TextStyle? style;
  final IconButton? leading;
  const CustomAppBar({
    Key? key,
    this.title,
    this.centerTitle = true,
    this.actions,
    this.color,
    this.style,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title ?? '',
        style: const TextStyle(
          color: Colors.blue,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: centerTitle,
      actions: actions,
      elevation: 0,
      backgroundColor: color ?? Colors.white,
      // leadingWidth: leading != null ? 56 : 0,
      leading: SizedBox(child: leading),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
