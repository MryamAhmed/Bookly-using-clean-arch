import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/core/extention/spacing.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import 'book_ratting.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.bookDetailsViewPath);
      },
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1.6 / 2,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.red,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        AssetsData.testImage,
                      ),
                    )),
              ),
            ),
            30.horizontal,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text('title',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle20.copyWith(//fontFamily: ),
                            )),
                  ),
                  3.vertical,
                  const Text('author'),
                  3.vertical,
                  Row(
                    children: [
                      Text(
                        'free',
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      const BookRatting(),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
