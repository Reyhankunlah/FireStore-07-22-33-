import 'package:flutter/material.dart';
import 'package:tugas1_11pplg2/Components/custom_color.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;

  const CustomAppbar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: CustomColor.primary,
      leading: leading,
      title: Text(
        title,
        style: const TextStyle(
          color: CustomColor.textWhite,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      centerTitle: centerTitle,
      actions: actions,
      iconTheme: const IconThemeData(color: CustomColor.textWhite),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}