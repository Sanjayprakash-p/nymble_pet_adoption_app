import 'package:flutter/material.dart';
import 'package:nymble_pet_adoption/provider/provider.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              context.read<ThemeControl>().themeValue();
            },
            child: const Text("switch")),
      ),
    );
  }
}
