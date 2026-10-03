import 'package:flutter/material.dart';

class ProfileForm extends StatefulWidget {
  //f
  final ValueChanged<String> onSaveUsername;
  const ProfileForm({super.key, required this.onSaveUsername});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: "Username",
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Username cannot be empty";
                }

                return null;
              },
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.onSaveUsername(_usernameController.text);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Profile saved: ${_usernameController.text}",
                      ),
                    ),
                  );
                }
              },
              child: const Text("Save Profile"),
            ),
          ],
        ),
      ),
    );
  }
}