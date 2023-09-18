import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'package:unjukketrampilan/config/colors.dart';
import 'package:unjukketrampilan/core/route/bloc_route.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    Key? key,
    required this.appbarText,
    this.isHome = false,
    this.onBack,
    this.action,
  }) : super(key: key);

  final String appbarText;
  final VoidCallback? onBack;
  final Widget? action;
  final bool? isHome;

  @override
  Size get preferredSize => const Size(double.infinity, 88);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.primary,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 88,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            (isHome ?? false)
                ? const SizedBox(
                    width: 34,
                    height: 34,
                  )
                : InkWell(
                    onTap: () {
                      if (onBack != null) {
                        onBack!();
                      }
                      RouteBloc().pop();
                    },
                    child: const SizedBox(
                      width: 34,
                      height: 34,
                      child: Icon(
                        IconlyLight.arrow_left_2,
                        color: CustomColors.white,
                      ),
                    )),
            (isHome ?? false)
                ? Row(
                    children: [
                      Image.asset('assets/logo.png', width: 40),
                      const SizedBox(width: 16),
                      Image.asset(
                        'assets/logo_name_bold.png',
                        width: 130,
                      )
                    ],
                  )
                : Text(
                    appbarText,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: CustomColors.white,
                    ),
                  ),
            SizedBox(
              width: 34,
              height: 34,
              child: (action != null) ? action : const SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
