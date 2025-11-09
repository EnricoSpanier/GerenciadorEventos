// 14. Tela de Pesquisa de Eventos
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchEventScreen extends StatefulWidget {
  const SearchEventScreen({super.key});

  @override
  State<SearchEventScreen> createState() => _SearchEventScreenState();
}

class _SearchEventScreenState extends State<SearchEventScreen> {
  final _searchController = TextEditingController();
  String _selectedDate = 'Qualquer data';
  String _selectedLocation = 'Qualquer local';
  String _selectedType = 'Qualquer tipo';
  List<Map<String, dynamic>> events = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _fetchEvents(String term) async {
    final response = await http.get(Uri.parse('http://localhost:8080/bff/events/search?term=$term'));
    if (response.statusCode == 200) {
      setState(() {
        events = jsonDecode(response.body);
      });
    }
  }

  List<Map<String, dynamic>> _filterEvents(String searchTerm) {
    return events.where((event) {
      final matchesSearch = event['event_name'].toLowerCase().contains(searchTerm.toLowerCase()) ||
          event['description'].toLowerCase().contains(searchTerm.toLowerCase());
      final matchesDate = _selectedDate == 'Qualquer data' || event['event_date'] == _selectedDate;
      final matchesLocation = _selectedLocation == 'Qualquer local' || event['address'] == _selectedLocation;
      final matchesType = _selectedType == 'Qualquer tipo' || event['type'] == _selectedType;
      return matchesSearch && matchesDate && matchesLocation && matchesType;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Procurar Evento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Pesquisar eventos...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (value) => setState(() => _fetchEvents(value)),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                DropdownButton<String>(
                  value: _selectedDate,
                  hint: const Text('Qualquer data'),
                  items: <String>['Qualquer data', '24/03/2024', '20/09/2025']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedDate = newValue!;
                    });
                  },
                ),
                DropdownButton<String>(
                  value: _selectedLocation,
                  hint: const Text('Qualquer local'),
                  items: <String>['Qualquer local', 'Santiago/RS', 'São Luis/MA']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedLocation = newValue!;
                    });
                  },
                ),
                DropdownButton<String>(
                  value: _selectedType,
                  hint: const Text('Qualquer tipo'),
                  items: <String>['Qualquer tipo', 'Público', 'Privado (Pago)', 'Privado (Gratuito)']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedType = newValue!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _filterEvents(_searchController.text).length,
                itemBuilder: (context, index) {
                  final event = _filterEvents(_searchController.text)[index];
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
                          Text('Descrição: ${event['description']}'),
                        ],
                      ),
                      onTap: () {
                        // Navegar para detalhes ou inscrição
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
