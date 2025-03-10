import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signUp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', nameController.text);
    await prefs.setString('lastName', lastNameController.text);
    await prefs.setString('phone', phoneController.text);
    await prefs.setString('email', emailController.text);
    await prefs.setString('password', passwordController.text);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/biryani.jpg"),
            fit: BoxFit.cover,
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(controller: nameController,
                  decoration:  InputDecoration(
                      labelText: 'First Name',
                      labelStyle: TextStyle(
                          color: Colors.white,),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  )),
              SizedBox(height: 10),
              TextField(controller: lastNameController,
                  decoration:  InputDecoration(
                      labelText: 'Last Name',
                      labelStyle: TextStyle(
                          color: Colors.white),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  )),
              SizedBox(height: 10),
              TextField(controller: phoneController, decoration:  InputDecoration(labelText: 'Phone Number',labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              )),
              SizedBox(height: 10),
              TextField(controller: emailController, decoration:  InputDecoration(labelText: 'Email',labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              )),
              SizedBox(height: 10),
              TextField(controller: passwordController, decoration: InputDecoration(labelText: 'Password',labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ), obscureText: true),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: signUp,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                child: const Padding(padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15), child: Text('Create Account', style: TextStyle(fontSize: 18))),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15),
                    child: Text('Back to Sign In ', style: TextStyle(fontSize: 18))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
