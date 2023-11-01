// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            width: 100,
            height: 100,
            child: Placeholder(),
          ),
          Text(
            'Profile Page',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            'Coming Soon!',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
