import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'register_page.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../components/square_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

bool isPressed = false;

class LoginPage extends StatefulWidget {
  final String role;

  const LoginPage({super.key, required this.role});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    checkCurrentUser();
  }

  Future<void> checkCurrentUser() async {
    final User? user = _auth.currentUser;
    if (user != null && user.emailVerified) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      String actualRole = userDoc.get('role');
      if (actualRole == widget.role) {
        if (!mounted) return;
        if (actualRole == 'teacher') {
          Navigator.pushReplacementNamed(context, '/teacher_home');
        } else if (actualRole == 'student') {
          Navigator.pushReplacementNamed(context, '/student_home');
        }
      }
    }
  }

  Future<void> signUserIn(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user?.emailVerified ?? false) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .get();

        String actualRole = userDoc.get('role');

        if (actualRole != widget.role) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("This account belongs to $actualRole"),
              backgroundColor: Colors.red,
            ),
          );
          return;
        }

        if (widget.role == 'teacher') {
          Navigator.pushReplacementNamed(context, '/teacher_home');
        } else if (widget.role == 'student') {
          Navigator.pushReplacementNamed(context, '/student_home');
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please verify your email before logging in.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = '';
      if (e.code == 'invalid-credential') {
        errorMessage = "Incorrect credentials, please try again.";
      } else if (e.code == 'invalid-email') {
        errorMessage = "Invalid email address, please try again.";
      } else if (e.code == 'missing-password') {
        errorMessage = "Password cannot be empty.";
      } else {
        errorMessage = "An error occurred. Please try again.";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("An unexpected error occurred: $e"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/animations/gradient7.jpg'), // Ensure this path is correct
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    Lottie.asset(
                      'assets/animations/Animation - 1736879941396.json',
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 30),
                    Text(
                      widget.role == 'student'
                          ? 'Welcome back, dear Student!'
                          : 'Welcome back, respected Teacher!',
                      style: const TextStyle(
                        color: Colors.white, // Changed text color to white
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    MyTextField(
                      controller: emailController,
                      hintText: 'Email',
                      obscureText: false,
                      backgroundColor: Colors.white.withOpacity(0.2), // Semi-transparent
                      textColor: Colors.white, // White text
                      borderColor: Colors.white,
                      borderRadius: 25,
                    ),
                    const SizedBox(height: 15),
                    MyTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                      backgroundColor: Colors.white.withOpacity(0.2), // Semi-transparent
                      textColor: Colors.white, // White text
                      borderColor: Colors.white,
                      borderRadius: 25,
                    ),
                    const SizedBox(height: 25),
                   // Add this inside your _LoginPageState class

                  MyButton(
                  onTap: () async {
            setState(() {
            isPressed = true;
            });

            await Future.delayed(Duration(milliseconds: 150)); // Short animation delay

            await signUserIn(context);

            setState(() {
            isPressed = false;
            });
            },
              text: 'Sign In',
              backgroundColor: isPressed
                  ? Colors.white.withOpacity(0.1) // Lighter shade when pressed
                  : Colors.white.withOpacity(0.3), // Normal state
              textColor: Colors.white,
              borderRadius: 25,
              shadowColor: isPressed
                  ? Colors.transparent // Remove shadow when pressed
                  : Colors.black.withOpacity(0.2), // Normal shadow
            ),

                    const SizedBox(height: 40),

                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.white, // White divider
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Or continue with',
                            style: TextStyle(color: Colors.white), // White text
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.white, // White divider
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SquareTile(imagePath: 'lib/images/google.png'),
                        SizedBox(width: 25),
                        SquareTile(imagePath: 'lib/images/apple.png'),
                      ],
                    ),

                    const SizedBox(height: 40),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Not a member?',
                          style: TextStyle(color: Colors.white), // White text
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Register now',
                            style: TextStyle(
                              color: Colors.blueAccent, // Stands out from white
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
