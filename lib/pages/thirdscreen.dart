// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/user_models.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  late Future<Users> futureUsers;
  late Users users;

  @override
  void initState() {
    super.initState();
  }

  Future<List<Datum>> getUsers() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?per_page=20'));

    if (response.statusCode == 200) {
      List<dynamic> body = (jsonDecode(response.body))['data'];

      List<Datum> users = body
          .map(
            (dynamic item) => Datum.fromJson(item),
          )
          .toList();

      return users;
    } else {
      throw "Unable to retrieve posts.";
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
      body: FutureBuilder(
        future: getUsers(),
        builder: (BuildContext context, AsyncSnapshot<List<Datum>> snapshot) {
          if (snapshot.hasData) {
            List<Datum>? users = snapshot.data;

            return ListView(
              children: users!
                  .map((Datum userData) => ListTile(
                        onTap: () {
                          Navigator.pop(
                              context,
                              userData.firstName +
                                  " " +
                                  userData.lastName.toString());
                        },
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            userData.avatar,
                            width: 49,
                            height: 49,
                          ),
                        ),
                        title:
                            Text(userData.firstName + " " + userData.lastName),
                        subtitle: Text(userData.email),
                      ))
                  .toList(),
            );
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
