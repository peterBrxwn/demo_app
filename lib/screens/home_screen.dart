import 'package:demo/constants/app_images.dart';
import 'package:demo/providers/auth_provider.dart';
import 'package:demo/screens/login_screen.dart';
import 'package:demo/widgets/shadowed_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Users', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 16.0),
              Expanded(
                child: ListView.separated(
                  itemCount: 4,
                  separatorBuilder: (context, index) {
                    return Divider(color: Theme.of(context).dividerColor);
                  },
                  itemBuilder: (context, index) {
                    return const ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(AppImages.profile),
                        backgroundColor: Colors.transparent,
                      ),
                      title: Text('Name'),
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: ShadowedContainer(
                  child: ElevatedButton(
                    onPressed:
                        authProvider.isLoading
                            ? null
                            : () async {
                              await authProvider.logout();
                              if (!context.mounted) return;

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const LoginScreen(),
                                ),
                              );
                            },
                    child:
                        authProvider.isLoading
                            ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            )
                            : const Text('Logout'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
