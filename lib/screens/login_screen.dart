import 'package:demo/widgets/shadowed_container.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Icon(Icons.close)],
                  ),
                  const SizedBox(height: 100.0),
                  Text('Login with email'),
                  const SizedBox(height: 24.0),
                  ShadowedContainer(
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(labelText: 'email'),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ShadowedContainer(
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'password',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Forgot password ?'),
                  ),
                  const SizedBox(height: 20.0),
                  ShadowedContainer(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Login'),
                    ),
                  ),
                  const SizedBox(height: 46.0),
                  Text('Don\'t have an account?', textAlign: TextAlign.center),
                  TextButton(onPressed: () {}, child: const Text('Sign Up')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
