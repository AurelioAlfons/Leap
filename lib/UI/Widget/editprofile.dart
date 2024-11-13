import 'package:flutter/material.dart';
import 'package:leap/UI/Widget/profilemodel.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  final nameController = TextEditingController();
  final titleController = TextEditingController();
  final skillsController = TextEditingController();
  final studiesController = TextEditingController();
  final certificatesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<ProfileModel>(context, listen: false);

    nameController.text = profile.name;
    titleController.text = profile.title;
    skillsController.text = profile.keySkills.join(', ');
    studiesController.text = profile.studies;
    certificatesController.text = profile.certificates;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              // Save changes
              profile.setName(nameController.text);
              profile.setTitle(titleController.text);
              profile.setSkills(skillsController.text
                  .split(',')
                  .map((skill) => skill.trim())
                  .toList());
              profile.setStudies(studiesController.text);
              profile.setCertificates(certificatesController.text);

              Navigator.pop(context); // Return to profile page
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            // Basic Info Section
            _buildSectionHeader("Basic Info", Icons.person),
            _buildTextField("Name", nameController),
            _buildTextField("Title", titleController),
            const Divider(height: 32, thickness: 1),

            // Skills Section
            _buildSectionHeader("Skills", Icons.build),
            _buildTextField("Key Skills (comma-separated)", skillsController),
            const Divider(height: 32, thickness: 1),

            // Education Section
            _buildSectionHeader("Education", Icons.school),
            _buildTextField("Studies", studiesController, maxLines: 2),
            const Divider(height: 32, thickness: 1),

            // Certifications Section
            _buildSectionHeader("Certifications", Icons.verified),
            _buildTextField("Certificates", certificatesController,
                maxLines: 2),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueGrey),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: "Enter $label",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
