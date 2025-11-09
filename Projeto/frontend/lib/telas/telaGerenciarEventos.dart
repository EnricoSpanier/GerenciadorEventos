
// 15. Tela de Gerenciamento de Eventos
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ManageEventsScreen extends StatefulWidget {
  const ManageEventsScreen({super.key});

  @override
  State<ManageEventsScreen> createState() => _ManageEventsScreenState();
}

class _ManageEventsScreenState extends State<ManageEventsScreen> {
  List<Map<String, dynamic>> enrolledEvents = [];
  List<Map<String, dynamic>> createdEvents = [];

  @override
  void initState() {
    super.initState();
    _fetchEvents();
  }

  Future<void> _fetchEvents() async {
    final user = Provider.of<HomePageData>(context, listen: false).user;
    final userId = user['id'];

    // Enrolled
    final enrolledResponse = await http.get(
      Uri.parse('http://localhost:8080/bff/event-wallets/user/$userId'),
    );
    if (enrolledResponse.statusCode == 200) {
      final wallets = jsonDecode(enrolledResponse.body) as List;
      List<Map<String, dynamic>> events = [];
      for (var wallet in wallets) {
        final eventResponse = await http.get(
          Uri.parse('http://localhost:8080/bff/events/${wallet['eventId']}'),
        );
        if (eventResponse.statusCode == 200) {
          events.add(jsonDecode(eventResponse.body));
        }
      }
      setState(() {
        enrolledEvents = events;
      });
    }

    // Created
    final createdResponse = await http.get(
      Uri.parse('http://localhost:8080/bff/events?creator_id=$userId'),
    );
    if (createdResponse.statusCode == 200) {
      setState(() {
        createdEvents = jsonDecode(createdResponse.body);
      });
    }
  }

  void _showDetailsDialog(BuildContext context, Map<String, dynamic> event) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(event['event_name']),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Data: ${event['event_date']}'),
                Text('Local: ${event['address']}'),
                Text('Tipo: ${event['type']}'),
                Text('Descrição: ${event['description']}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  void _showCancelConfirmation(BuildContext context, Map<String, dynamic> event) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Cancelamento'),
          content: const Text('Tem certeza que deseja cancelar a inscrição neste evento?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Não'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                final user = Provider.of<HomePageData>(context, listen: false).user;
                final userId = user['id'];
                final eventId = event['event_id'];
                final response = await http.delete(
                  Uri.parse('http://localhost:8080/bff/event-wallets?userId=$userId&eventId=$eventId'),
                );
                if (response.statusCode == 200) {
                  setState(() {
                    enrolledEvents.remove(event);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Inscrição cancelada!')),
                  );
                }
              },
              child: const Text('Sim'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Eventos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Eventos Inscritos',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            ...enrolledEvents.map((event) {
              return Card(
                elevation: 2.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  leading: Image.network(
                    event['imageUrl'] ?? 'https://i.imgur.com/error.png',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                  ),
                  title: Text(event['event_name']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Data: ${event['event_date']}'),
                      Text('Local: ${event['address']}'),
                      Text('Tipo: ${event['type']}'),
                    ],
                  ),
                  trailing: PopupMenuButton<String>(
                    onSelected: (String value) {
                      if (value == 'Ver Detalhes') {
                        _showDetailsDialog(context, event);
                      } else if (value == 'Cancelar Inscrição') {
                        _showCancelConfirmation(context, event);
                      }
                    },
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: 'Ver Detalhes',
                        child: Text('Ver Detalhes'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Cancelar Inscrição',
                        child: Text('Cancelar Inscrição'),
                      ),
                    ],
                    icon: const Icon(Icons.more_vert),
                  ),
                ),
              );
            }).toList(),
            const SizedBox(height: 16.0),
            const Text(
              'Eventos Criados por Você',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            ...createdEvents.map((event) {
              return Card(
                elevation: 2.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  leading: Image.network(
                    event['imageUrl'] ?? 'https://i.imgur.com/error.png',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                  ),
                  title: Text(event['event_name']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Data: ${event['event_date']}'),
                      Text('Local: ${event['address']}'),
                      Text('Tipo: ${event['type']}'),
                    ],
                  ),
                  trailing: PopupMenuButton<String>(
                    onSelected: (String value) {
                      if (value == 'Ver Detalhes') {
                        _showDetailsDialog(context, event);
                      } else if (value == 'Gerenciar Evento') {
                        // TODO: Navegar para gerenciamento
                      }
                    },
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: 'Ver Detalhes',
                        child: Text('Ver Detalhes'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Gerenciar Evento',
                        child: Text('Gerenciar Evento'),
                      ),
                    ],
                    icon: const Icon(Icons.more_vert),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
