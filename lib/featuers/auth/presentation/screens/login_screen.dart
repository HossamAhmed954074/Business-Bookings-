import 'package:bussines_booking/core/routers/router.dart';
import 'package:bussines_booking/featuers/auth/presentation/widgets/business_portal_logo.dart';
import 'package:bussines_booking/featuers/auth/presentation/widgets/email_input_field.dart';
import 'package:bussines_booking/featuers/auth/presentation/widgets/gears_illustration.dart';
import 'package:bussines_booking/featuers/auth/presentation/widgets/login_button.dart';
import 'package:bussines_booking/featuers/auth/presentation/widgets/password_input_field.dart';
import 'package:bussines_booking/featuers/auth/presentation/widgets/signup_link.dart';
import 'package:bussines_booking/featuers/auth/presentation/widgets/welcome_header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    context.go(AppRouters.sliderRoute);
    // if (_formKey.currentState!.validate()) {
    //   setState(() {
    //     _isLoading = true;
    //   });

    //   // TODO: Implement actual login logic
    //   Future.delayed(const Duration(seconds: 2), () {
    //     if (mounted) {
    //       setState(() {
    //         _isLoading = false;
    //       });
    //       // Navigate to home screen or show error
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         const SnackBar(content: Text('Login functionality coming soon!')),
    //       );
    //     }
    //   });
    // }
  }

  void _handleSignUp() {
    // TODO: Navigate to sign up screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Sign up functionality coming soon!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        title: const Text('Login', style: TextStyle(color: Colors.black87)),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Responsive layout: switch between column and row based on width
            final isWideScreen = constraints.maxWidth > 800;

            if (isWideScreen) {
              return _buildWideLayout();
            } else {
              return _buildNarrowLayout();
            }
          },
        ),
      ),
    );
  }

  // Layout for desktop/wide screens
  Widget _buildWideLayout() {
    return Row(
      children: [
        // Left side - Form
        Expanded(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(40),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: _buildLoginForm(),
              ),
            ),
          ),
        ),
        // Right side - Illustration
        Expanded(
          child: Container(
            color: Colors.grey[50],
            child: const Center(child: GearsIllustration()),
          ),
        ),
      ],
    );
  }

  // Layout for mobile/narrow screens
  Widget _buildNarrowLayout() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          _buildLoginForm(),
          const SizedBox(height: 40),
          const GearsIllustration(),
        ],
      ),
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Logo
          const BusinessPortalLogo(),
          const SizedBox(height: 32),

          // Welcome Header
          const WelcomeHeader(),
          const SizedBox(height: 32),

          // Email Field
          EmailInputField(
            controller: _emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              ).hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),

          // Password Field
          PasswordInputField(
            controller: _passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
          const SizedBox(height: 32),

          // Login Button
          LoginButton(onPressed: _handleLogin, isLoading: _isLoading),
          const SizedBox(height: 20),

          // Sign Up Link
          SignUpLink(onPressed: _handleSignUp),
        ],
      ),
    );
  }
}
