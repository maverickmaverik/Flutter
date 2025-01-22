import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  final Function()? onTap;
  const RegisterScreen({super.key, required this.onTap});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthService _auth = AuthService();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool _isLoading = false;
  int _emailLength = 0;
  int _passwordLength = 0;
  int _confirmPasswordLength = 0;

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {
        _emailLength = emailController.text.length;
      });
      if (_emailLength > 50) {
        emailController.text = emailController.text.substring(0, 50);
        emailController.selection = TextSelection.fromPosition(
          const TextPosition(offset: 50),
        );
        setState(() {
          _emailLength = 50;
        });
      }
    });

    passwordController.addListener(() {
      setState(() {
        _passwordLength = passwordController.text.length;
      });
      if (_passwordLength > 50) {
        passwordController.text = passwordController.text.substring(0, 50);
        passwordController.selection = TextSelection.fromPosition(
          const TextPosition(offset: 50),
        );
        setState(() {
          _passwordLength = 50;
        });
      }
    });

    confirmPasswordController.addListener(() {
      setState(() {
        _confirmPasswordLength = confirmPasswordController.text.length;
      });
      if (_confirmPasswordLength > 50) {
        confirmPasswordController.text =
            confirmPasswordController.text.substring(0, 50);
        confirmPasswordController.selection = TextSelection.fromPosition(
          const TextPosition(offset: 50),
        );
        setState(() {
          _confirmPasswordLength = 50;
        });
      }
    });
  }

  Future<void> signUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      await _auth.registerWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Widget buildInputField({
    required String label,
    required TextEditingController controller,
    required bool obscureText,
    required int charactersTyped,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        TextField(
          controller: controller,
          obscureText: obscureText,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            suffixText: '$charactersTyped/50',
            suffixStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
            contentPadding: const EdgeInsets.only(top: 8),
          ),
          keyboardType: label == 'Email' ? TextInputType.emailAddress : null,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 250),
              buildInputField(
                label: 'Email',
                controller: emailController,
                obscureText: false,
                charactersTyped: _emailLength,
              ),
              const SizedBox(height: 24),
              buildInputField(
                label: 'Password',
                controller: passwordController,
                obscureText: true,
                charactersTyped: _passwordLength,
              ),
              const SizedBox(height: 24),
              buildInputField(
                label: 'Confirm Password',
                controller: confirmPasswordController,
                obscureText: true,
                charactersTyped: _confirmPasswordLength,
              ),
              const SizedBox(height: 32),
              Center(
                child: SizedBox(
                  width: 160,
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1E1E),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      onPressed: _isLoading ? null : signUp,
                      child: _isLoading
                          ? const SizedBox(
                              height: 16,
                              width: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  TextButton(
                    onPressed: _isLoading ? null : widget.onTap,
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                    child: const Text(
                      'Login now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}