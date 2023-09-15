import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'package:unjukketrampilan/core/route/bloc_route.dart';
import 'package:unjukketrampilan/core/route/bloc_route.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    Key? key,
    required this.appbarText,
    this.onBack,
  }) : super(key: key);

  final String appbarText;
  final VoidCallback? onBack;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 88);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      height: 88,
      child: SafeArea(
        child: Row(
          children: [
            InkWell(
              onTap: () {
                if (onBack != null) {
                  onBack!();
                }
                RouteBloc().pop();
              },
              child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  // color: Colors.amber,
                  child: const Icon(
                    IconlyLight.arrow_left,
                  )),
            ),
            const SizedBox(width: 4),
            Text(
              appbarText,
            ),
          ],
        ),
      ),
    );
  }
}
