import 'package:demo/constants/app_images.dart';
import 'package:demo/providers/auth_provider.dart';
import 'package:demo/screens/login_screen.dart';
import 'package:demo/services/firestore_service.dart';
import 'package:demo/widgets/shadowed_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _firestoreService = FirestoreService();

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
                child: StreamBuilder<List<Map<String, dynamic>>>(
                  stream: _firestoreService.streamDocuments('users'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }

                    final users = snapshot.data ?? [];

                    if (users.isEmpty) {
                      return const Center(child: Text('No users found.'));
                    }

                    return ListView.separated(
                      itemCount: users.length,
                      separatorBuilder: (context, index) {
                        return Divider(color: Theme.of(context).dividerColor);
                      },
                      itemBuilder: (context, index) {
                        final user = users[index];
                        return ListTile(
                          leading: const CircleAvatar(
                            backgroundImage: AssetImage(AppImages.profile),
                            backgroundColor: Colors.transparent,
                          ),
                          title: Text(user['name'] ?? 'Anon'),
                        );
                      },
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

                              Navigator.pushReplacement(
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
