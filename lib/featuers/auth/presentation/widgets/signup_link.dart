import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignUpLink extends StatelessWidget {
  const SignUpLink({required this.onPressed, super.key});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
        ),
        GestureDetector(
          onTap: onPressed,
          child: const Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF1DA1F2),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      ObjectFlagProperty<VoidCallback>.has('onPressed', onPressed),
    );
  }
}
