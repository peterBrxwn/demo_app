import 'package:demo/widgets/shadowed_container.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                  const SizedBox(height: 24.0),
                  Text('Sign up with email'),
                  const SizedBox(height: 24.0),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person,
                      size:
                          Theme.of(context).textTheme.headlineLarge?.fontSize,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  ShadowedContainer(
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(labelText: 'Name'),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ShadowedContainer(
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(labelText: 'Email'),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ShadowedContainer(
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  ShadowedContainer(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Sign Up'),
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  Text('Already have an account?', textAlign: TextAlign.center),
                  TextButton(onPressed: () {}, child: const Text('Login')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
