// Carregue enrolledEvents e createdEvents da API
final response = await ApiService.get('/registrations/me');
enrolledEvents = json.decode(response.body);

// Para created
final createdResponse = await ApiService.get('/events?creator_id=me');
createdEvents = json.decode(createdResponse.body);
