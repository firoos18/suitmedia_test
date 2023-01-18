import 'package:flutter/material.dart';
import 'package:suitmedia_test/pages/thirdscreen.dart';

class SecondScreen extends StatefulWidget {
  final name;
  const SecondScreen({super.key, required this.name});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Second Screen',
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
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(
          top: 48,
          right: 20,
          left: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              'Welcome',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color(0xff04021D),
              ),
            ),
            Text(
              widget.name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Color(0xff04021D),
              ),
            ),
            const SizedBox(
              height: 225,
            ),
            const Center(
              child: Text(
                'Selected User Name',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff04021D),
                ),
              ),
            ),
            const SizedBox(
              height: 315,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ThirdScreen()));
              },
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  fixedSize: Size(MediaQuery.of(context).size.width, 40),
                  backgroundColor: const Color(0xff2B637B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
              child: const Text(
                'Choose a User',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
            )
          ],
        ),
      )),
    );
  }
}
