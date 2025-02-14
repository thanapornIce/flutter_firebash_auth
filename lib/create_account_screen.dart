import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/auth_service.dart';
import 'login_screen.dart';

class CreateAccountScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final AuthService _authService = AuthService();

  CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> createAccount() async {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      final confirmPassword = _confirmPasswordController.text.trim();

      if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
        _showMessage(context, "กรุณากรอกข้อมูลให้ครบ");
        return;
      }
      if (password != confirmPassword) {
        _showMessage(context, "รหัสผ่านไม่ตรงกัน");
        return;
      }

      try {
        await _authService.register(email, password);
        // ignore: use_build_context_synchronously
        _showMessage(context, "สมัครสมาชิกสำเร็จ!", success: true);
        Navigator.pushReplacement(
            // ignore: use_build_context_synchronously
            context,
            MaterialPageRoute(builder: (_) => LoginScreen()));
      } catch (e) {
        // ignore: use_build_context_synchronously
        _showMessage(context, e.toString());
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text('Create Account')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _buildTextField(_emailController, 'Email'),
            _buildTextField(_passwordController, 'Password', obscureText: true),
            _buildTextField(_confirmPasswordController, 'Confirm Password',
                obscureText: true),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: createAccount,
              child: Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration:
            InputDecoration(labelText: label, border: OutlineInputBorder()),
        obscureText: obscureText,
      ),
    );
  }

  void _showMessage(BuildContext context, String message,
      {bool success = false}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: success ? Colors.green : Colors.red,
    ));
  }
}
