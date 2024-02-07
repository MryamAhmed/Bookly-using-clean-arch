import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/core/extention/spacing.dart';

import '../../../../../../core/utils/styles.dart';

class BookRatting extends StatelessWidget {
  const BookRatting(
      {Key? key, this.mainAxisAlignment = MainAxisAlignment.start})
      : super(key: key);
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 14,
        ),
        6.3.vertical,
        const Text(
          '4.8',
          style: Styles.textStyle16,
        ),
        5.horizontal,
        Opacity(
          opacity: .5,
          child: Text(
            '(245)',
            style: Styles.textStyle14.copyWith(
                color: const Color(0xff707070), fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
