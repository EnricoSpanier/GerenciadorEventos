// Adicione controllers
final _nameController = TextEditingController();
final _emailController = TextEditingController();
final _passwordController = TextEditingController();

// Substitua TextField
TextField(controller: _nameController, ...),
TextField(controller: _emailController, ...),
TextField(controller: _passwordController, obscureText: true, ...),

ElevatedButton(
  onPressed: () async {
    final response = await ApiService.post('/auth/register', {
      'name': _nameController.text,
      'email': _emailController.text,
      'password': _passwordController.text,
    });
    if (response.statusCode == 200) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cadastro falhou')));
    }
  },
  child: const Text('Completar cadastro'),
),
