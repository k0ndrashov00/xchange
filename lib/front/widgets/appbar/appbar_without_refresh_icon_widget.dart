import 'package:flutter/material.dart';
import 'package:xchange/front/theme.dart';

class AppbarWithoutRefreshIconWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWithoutRefreshIconWidget({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      title: Text(
        'Xchange',
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * firstTextSize,
          fontWeight: fontWeight,
          color: firstTextColor
        ),
      ),
    );
  }
}