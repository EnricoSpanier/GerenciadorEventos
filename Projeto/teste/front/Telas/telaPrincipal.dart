// Use FutureBuilder para _MainContentCard
final response = await ApiService.get('/events/featured');
final featured = json.decode(response.body);
