import 'package:flutter/cupertino.dart';

import 'package:rive/rive.dart';

class ButtonAnimaion extends StatelessWidget {
  ButtonAnimaion({
    Key? key,
    required this.press,
    required this.title,
  }) : super(key: key);

  final String title;
  final VoidCallback press;

  final RiveAnimationController _btnAnimationColtroller = OneShotAnimation(
    "active",
    autoplay: false,
  );

  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        height: 64,
        width: 260,
        child: Stack(
          children: [
          
            RiveAnimation.asset(
              "assets/icons/button.riv",
              controllers: [_btnAnimationColtroller],
            ),
            Positioned.fill(
              top: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(CupertinoIcons.arrow_right),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
