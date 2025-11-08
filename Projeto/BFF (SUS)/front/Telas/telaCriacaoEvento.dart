// Adicione import 'package:image_picker/image_picker.dart';
File? _image;
final picker = ImagePicker();

// Adicione botão para selecionar imagem
ElevatedButton(
  onPressed: () async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) setState(() { _image = File(pickedFile.path); });
  },
  child: const Text('Selecionar Imagem'),
),

// No _confirmCreate
final response = await ApiService.multipartPost('/events', {
  'title': _titleController.text,
  'date': _dateController.text,
  'location': _locationController.text,
  'type': _eventType!,
  'description': _descriptionController.text,
}, files: _image != null ? {'image': _image.path} : null);

if (response.statusCode == 201) {
  // Sucesso
}
