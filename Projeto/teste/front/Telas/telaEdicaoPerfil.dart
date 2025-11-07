ElevatedButton(
  onPressed: () async {
    final response = await ApiService.post('/users/me', {
      'name': _nameController.text,
      'email': _emailController.text,
      'bio': _bioController.text,
    });
    if (response.statusCode == 200) {
      // Sucesso
    }
  },
  child: const Text('Confirmar edição'),
),
