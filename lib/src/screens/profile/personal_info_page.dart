import 'package:flutter/material.dart';

class MemberPersonalInfoPage extends StatefulWidget {
  const MemberPersonalInfoPage({super.key});

  @override
  State<MemberPersonalInfoPage> createState() => _MemberPersonalInfoPageState();
}

class _MemberPersonalInfoPageState extends State<MemberPersonalInfoPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController(text: "John Smith");
  final TextEditingController emailController = TextEditingController(text: "john.smith@example.com");
  final TextEditingController phoneController = TextEditingController(text: "+60 123-4567");
  final TextEditingController dobController = TextEditingController(text: "March 15, 2000");
  final TextEditingController addressController = TextEditingController(text: "123 Jalan Nenas,\nTaman Meru, Selangor");

  String gender = "Male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Information"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/default_profile.png'),
                    ),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.camera_alt, size: 18, color: Color(0xFF5F26B4)),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text("Change Photo", style: TextStyle(color: Color(0xFF5F26B4), fontWeight: FontWeight.w500)),
              ),
              const SizedBox(height: 24),
              _buildTextField("Full Name", nameController),
              _buildTextField("Email Address", emailController, keyboardType: TextInputType.emailAddress),
              _buildTextField("Phone Number", phoneController, keyboardType: TextInputType.phone),
              _buildTextField("Date of Birth", dobController),
              _buildGenderDropdown(),
              _buildTextField("Address", addressController, maxLines: 2),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // save logic
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5F26B4),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text("Save Changes", style: TextStyle(fontSize: 16)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {TextInputType keyboardType = TextInputType.text, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildGenderDropdown() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DropdownButtonFormField<String>(
        value: gender,
        items: ["Male", "Female", "Other"]
            .map((g) => DropdownMenuItem(value: g, child: Text(g)))
            .toList(),
        onChanged: (val) => setState(() => gender = val ?? "Male"),
        decoration: const InputDecoration(
          labelText: "Gender",
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}