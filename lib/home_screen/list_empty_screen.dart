import 'package:contacts_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyListScreen extends StatelessWidget {
  const EmptyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Image.asset(
            'assets/images/route_1.png',
            width: 117,
          ),
        ),
        Lottie.asset('assets/images/animation/empty_list.json'),
        Text(
          'There is No Contacts Added Here',
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
              fontWeight: FontWeight.w500, color: MyTheme.secondaryColor),
        )
      ],
    );
  }
}
