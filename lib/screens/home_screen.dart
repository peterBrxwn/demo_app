import 'package:demo/constants/app_images.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Users', style: TextTheme.of(context).titleMedium),
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
            ],
          ),
        ),
      ),
    );
  }
}
