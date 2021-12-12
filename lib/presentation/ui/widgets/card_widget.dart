import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;

  const CardWidget({
    Key? key,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(username),
              ],
            ),
            Text(
              email,
            ),
            Text(
              phone,
            ),
            Text(
              website,
            )
          ],
        ),
      ),
    );
  }
}
