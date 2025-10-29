import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:que_comer_hoy/theme/theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // For now, we use the mock user profile.
    // Later, this will come from a stream or future from Firebase.
    final userProfile = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      backgroundColor: beigeColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: userProfile?.photoURL?.isNotEmpty ?? false
                  ? NetworkImage(userProfile!.photoURL!)
                  : null,
              child: userProfile?.photoURL?.isEmpty ?? true
                  ? const Icon(Icons.person, size: 50)
                  : null,
            ),
            const SizedBox(height: 20),
            Text(
              userProfile?.displayName ?? 'Usuario Anónimo',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 10),
            Text(
              userProfile?.email ?? 'Sin email',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
