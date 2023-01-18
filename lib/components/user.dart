import 'package:flutter/material.dart';

class User extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String imageUrl;
  final String email;

  const User({
    super.key,
    required this.firstName,
    required this.imageUrl,
    required this.lastName,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: [
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                imageUrl,
                width: 49,
                height: 49,
              ),
            ),
            title: Row(
              children: [
                Text(firstName),
                const SizedBox(
                  width: 3,
                ),
                Text(lastName),
              ],
            ),
            subtitle: Text(email),
          )
        ],
      ),
    );
  }
}
