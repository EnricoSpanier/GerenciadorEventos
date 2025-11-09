import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'telas/telaLogin.dart'; // Assumindo import

// 1. DATA_MODEL
class HomePageData extends ChangeNotifier {
  final String siteName;
  final List<String> navLinks;
  String userName;
  String userAvatarUrl;
  String mainImageUrl;
  String mainImageOverlayText;
  List<Map<String, dynamic>> events = []; // Adicionado para eventos dinâmicos

  HomePageData()
      : siteName = 'Organizador de Eventos',
        navLinks = const ['Procurar evento', 'Gerenciar eventos'],
        userName = 'Usuário 982',
        userAvatarUrl =
            'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
        mainImageUrl =
            'https://i.imgur.com/xNdRovc.jpeg',
        mainImageOverlayText = '';

  void setUser(dynamic user) {
    userName = user['name'];
    // Atualizar avatar se disponível
    notifyListeners();
  }

  void setEvents(List<Map<String, dynamic>> newEvents) {
    events = newEvents;
    notifyListeners();
  }
}

// 2. O Widget Raiz (Root Widget)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageData>(
      create: (BuildContext context) => HomePageData(),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Custom UI App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: const HomeScreen(),
        );
      },
    );
  }
}

// 3. Homepage sem login
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _fetchEvents();
  }

  Future<void> _fetchEvents() async {
    final response = await http.get(Uri.parse('http://localhost:8080/bff/events/search?term='));
    if (response.statusCode == 200) {
      final eventsData = jsonDecode(response.body) as List;
      Provider.of<HomePageData>(context, listen: false).setEvents(eventsData.map((e) => e as Map<String, dynamic>).toList());
    }
  }

  @override
  Widget build(BuildContext context) {
    final HomePageData homePageData = Provider.of<HomePageData>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _TopNavigationBar(homePageData: homePageData),
            _UserProfileSection(homePageData: homePageData),
            _MainContentCard(homePageData: homePageData),
            const _ActionButtonsSection(),
          ],
        ),
      ),
    );
  }
}

// 4. Widget: Barra de Navegação Superior
class _TopNavigationBar extends StatelessWidget {
  final HomePageData homePageData;

  const _TopNavigationBar({required this.homePageData});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              homePageData.siteName,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            IconButton(
              icon: const Icon(Icons.more_vert, size: 28),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Outros widgets ajustados para usar homePageData.events em vez de hardcode, ex.: em _MainContentCard
// Por exemplo, substituir hardcoded cards por ListView de homePageData.events
