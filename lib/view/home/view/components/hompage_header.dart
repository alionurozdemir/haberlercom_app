import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/svg/menu.svg",
          height: 20,
        ),
        const SizedBox(
          width: 17,
        ),
        SvgPicture.asset(
          "assets/svg/logo.svg",
          height: 18,
        ),
        const Spacer(),
        SvgPicture.asset(
          "assets/svg/search.svg",
          height: 20,
        ),
        const SizedBox(
          width: 20,
        ),
        SvgPicture.asset(
          "assets/svg/settings.svg",
          height: 20,
        ),
      ],
    );
  }
}
