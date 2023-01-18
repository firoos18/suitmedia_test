import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:suitmedia_test/components/user.dart';
import '../models/user_models.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  late Future<Users> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = fetchUsers();
  }

  Future<Users> fetchUsers() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users'));

    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = jsonDecode(response.body);
      List<dynamic> data = myMap['data'];

      data.forEach((element) {
        (element as Map<String, dynamic>).forEach((key, value) {
          Users.fromJson(element);
        });
      });

      return Users.fromJson(jsonDecode(response.body)['data'][3]);
    } else {
      throw Exception('Failed to Load Users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Third Screen',
          style: TextStyle(
            color: Color(0xff04021D),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.chevron_left,
            color: Color(0xff554AF0),
            size: 28,
          ),
        ),
      ),
      body: FutureBuilder<Users>(
        future: futureUsers,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return User(
                firstName: snapshot.data!.first_name,
                imageUrl: snapshot.data!.avatar,
                lastName: snapshot.data!.last_name,
                email: snapshot.data!.email);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
