// 16. Tela de Inscrição de evento
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EventRegistrationScreen extends StatefulWidget {
  final Map<String, dynamic> event;
  const EventRegistrationScreen({super.key, required this.event});

  @override
  State<EventRegistrationScreen> createState() => _EventRegistrationScreenState();
}

class _EventRegistrationScreenState extends State<EventRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _participantsController = TextEditingController();
  String? _paymentMethod;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _participantsController.dispose();
    super.dispose();
  }

  Future<void> _submitRegistration(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final user = Provider.of<HomePageData>(context, listen: false).user;
      final enrollment = {
        'userId': user['id'],
        'eventId': widget.event['event_id'],
      };

      final response = await http.post(
        Uri.parse('http://localhost:8080/bff/event-wallets'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(enrollment),
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Inscrição realizada com sucesso!')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Falha na inscrição')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inscrição - ${widget.event['title']}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Detalhes do Evento',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Card(
                  elevation: 2.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    leading: Image.network(
                      widget.event['imageUrl'] ?? 'https://i.imgur.com/error.png',
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                    ),
                    title: Text(widget.event['event_name']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Data: ${widget.event['event_date']}'),
                        Text('Local: ${widget.event['address']}'),
                        Text('Tipo: ${widget.event['type']}'),
                        Text('Descrição: ${widget.event['description']}'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Dados do Participante',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                // ... campos iguais
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () => _submitRegistration(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      ),
                      child: const Text('Confirmar Inscrição'),
                    ),
                    // Cancelar igual
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
