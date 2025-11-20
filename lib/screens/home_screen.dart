import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:que_comer_hoy/screens/plan_screen.dart';
import 'package:que_comer_hoy/screens/profile_screen.dart';
import 'package:que_comer_hoy/screens/search_screen.dart';
import 'package:que_comer_hoy/services/auth_service.dart';
import 'package:que_comer_hoy/theme/theme.dart'; // Importa los colores y temas
import 'package:que_comer_hoy/widgets/recipe_card.dart';

class HomeScreen extends StatefulWidget {
  final User user;

  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      HomeTab(user: widget.user),
      const SearchScreen(),
      const PlanScreen(),
      const ProfileScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Plan'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

// This widget contains the original content of the HomeScreen
class HomeTab extends StatelessWidget {
  final User user;
  final AuthService _auth = AuthService();

  HomeTab({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
      backgroundColor: beigeColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RecipeCard(
            title: 'Ensalada mediterránea',
            description: 'Rica en omega-3 y antioxidantes',
            time: '15 min',
            servings: '2 personas',
            icon: Icons.restaurant_menu,
          ),
          const SizedBox(height: 16),
          Text('Bienvenido, ${user.displayName ?? 'Usuario'}'),
        ],
      ),
    );
  }
}
