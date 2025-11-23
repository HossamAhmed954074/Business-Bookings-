import 'package:bussines_booking/core/routers/router.dart';
import 'package:bussines_booking/featuers/auth/presentation/cubit/auth_cubit.dart';
import 'package:bussines_booking/featuers/auth/presentation/cubit/auth_state.dart';
import 'package:bussines_booking/featuers/auth/presentation/widgets/business_portal_logo.dart';
import 'package:bussines_booking/featuers/auth/presentation/widgets/email_input_field.dart';
import 'package:bussines_booking/featuers/auth/presentation/widgets/gears_illustration.dart';
import 'package:bussines_booking/featuers/auth/presentation/widgets/login_button.dart';
import 'package:bussines_booking/featuers/auth/presentation/widgets/password_input_field.dart';
import 'package:bussines_booking/featuers/auth/presentation/widgets/signup_link.dart';
import 'package:bussines_booking/featuers/auth/presentation/widgets/welcome_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      context.read<AuthCubit>().login(
        email: _emailController.text,
        password: _passwordController.text,
      );
    }
  }

  void _handleSignUp() {
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
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            _isLoading = false;
            context.go(AppRouters.sliderRoute);
          }
          if (state is AuthLoading) {
            _isLoading = true;
          }
          if (state is AuthError) {
            _isLoading = false;
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isWideScreen = constraints.maxWidth > 800;

              if (isWideScreen) {
                return _buildWideLayout();
              } else {
                return _buildNarrowLayout();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildWideLayout() {
    return Row(
      children: [
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
