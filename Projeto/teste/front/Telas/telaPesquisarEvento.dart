// No build, use FutureBuilder ou setState após busca
final response = await ApiService.get('/events?search=${_searchController.text}&date=$_selectedDate&location=$_selectedLocation&type=$_selectedType');
events = json.decode(response.body);
