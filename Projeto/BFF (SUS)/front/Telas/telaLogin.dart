// Adicione controllers para email e password
final _emailController = TextEditingController();
final _passwordController = TextEditingController();

// No build, substitua TextField por controllers
TextField(controller: _emailController, ...),
TextField(controller: _passwordController, obscureText: true, ...),

ElevatedButton(
  onPressed: () async {
    final response = await ApiService.post('/auth/login', {
      'email': _emailController.text,
      'password': _passwordController.text,
    });
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      await ApiService.saveToken(data['token']);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Login falhou')));
    }
  },
  child: const Text('Logar'),
),
