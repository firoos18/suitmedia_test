import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suitmedia_test/pages/secondscreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _nameController = TextEditingController();
  final _palindromeController = TextEditingController();

  dynamic isPalindrome() {
    String original = _palindromeController.text.trim();

    String reverse = original.split('').reversed.join('');

    if (original == reverse) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade200,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(
          top: 180,
          right: 32,
          left: 32,
        ),
        child: SingleChildScrollView(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // Profile Image
              Image.asset('lib/assets/ic_photo.png'),
              const SizedBox(
                height: 60,
              ),

              // Name Text Field
              SizedBox(
                height: 40,
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.only(top: 8, left: 20, bottom: 8),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Name',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: const Color(0xff686777).withOpacity(0.36),
                      fontWeight: FontWeight.bold,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xffE2E3E4),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xffE2E3E4),
                        width: 0.5,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 22,
              ),

              // Palindrome Text Field
              SizedBox(
                height: 40,
                child: TextField(
                  controller: _palindromeController,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.only(top: 8, left: 20, bottom: 8),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Palindrome',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: const Color(0xff686777).withOpacity(0.36),
                      fontWeight: FontWeight.bold,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xffE2E3E4),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xffE2E3E4),
                        width: 0.5,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 45,
              ),

              // Check Button
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Is Palindrome?'),
                          content: Text(
                            isPalindrome() ? 'True' : 'False',
                            style: const TextStyle(fontSize: 14),
                          ),
                        );
                      });

                  // isPalindrome();
                },
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color(0xff2B637B),
                    fixedSize: Size(MediaQuery.of(context).size.width, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                child: Text(
                  'CHECK',
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              // Next Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondScreen()));
                },
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color(0xff2B637B),
                    fixedSize: Size(MediaQuery.of(context).size.width, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                child: Text(
                  'NEXT',
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
