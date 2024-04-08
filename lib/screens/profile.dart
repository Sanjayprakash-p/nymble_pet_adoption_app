import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nymble_pet_adoption/provider/provider.dart';

import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
        body: Stack(
      children: [
        Stack(
          children: [
            ListView(children: [
              const SizedBox(
                height: 16,
              ),
              const Center(
                child: CircleAvatar(
                  radius: 80,
                  child: Icon(
                    Icons.person,
                    size: 75,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "User",
                style: themeData.textTheme.headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Card(
                child: ListTile(
                  onTap: () {
                    context.read<ThemeControl>().themeValue();
                  },
                  leading: (context.read<ThemeControl>().value)
                      ? const Icon(CupertinoIcons.lightbulb)
                      : const Icon(CupertinoIcons.sun_max),
                  title: (context.read<ThemeControl>().value)
                      ? const Text('Light Mode')
                      : const Text('Dark Mode'),
                ),
              ),
            ]),
          ],
        ),
      ],
    ));
  }
}
