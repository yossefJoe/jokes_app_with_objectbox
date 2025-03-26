import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class FingerprintAuth extends StatefulWidget {
  @override
  _FingerprintAuthState createState() => _FingerprintAuthState();
}

class _FingerprintAuthState extends State<FingerprintAuth> {
  final LocalAuthentication auth = LocalAuthentication();

  Future<void> _authenticate() async {
    try {
      bool isAuthenticated = await auth.authenticate(
        localizedReason: 'Please authenticate',
        options: AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );

      if (isAuthenticated) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Authentication Successful!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Authentication Failed!')),
        );
      }
    } catch (e) {
      print('Error during authentication: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fingerprint Authentication")),
      body: Center(
        child: ElevatedButton(
          onPressed: _authenticate,
          child: Text("Authenticate with Fingerprint"),
        ),
      ),
    );
  }
}
