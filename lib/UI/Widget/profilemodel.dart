import 'package:flutter/material.dart';

class ProfileModel with ChangeNotifier {
  // Initial values for the profile information
  String _name = "Name";
  String _title = "Mobile App Developer | UI/UX Designer";
  List<String> _keySkills = ["Flutter", "Dart", "Firebase"];
  String _studies =
      "Bachelor of Science in Computer Science, University of Technology, 2021-2024\nMobile Application Development, Online Course, 2022";
  String _certificates =
      "Google Flutter Certificate, Earned June 2023\nAWS Cloud Practitioner, Earned August 2023";

  // Getters
  String get name => _name;
  String get title => _title;
  List<String> get keySkills => _keySkills;
  String get studies => _studies;
  String get certificates => _certificates;

  // Setters with notifyListeners to update consumers when data changes
  void setName(String newName) {
    _name = newName;
    notifyListeners();
  }

  void setTitle(String newTitle) {
    _title = newTitle;
    notifyListeners();
  }

  void setSkills(List<String> newSkills) {
    _keySkills = newSkills;
    notifyListeners();
  }

  void setStudies(String newStudies) {
    _studies = newStudies;
    notifyListeners();
  }

  void setCertificates(String newCertificates) {
    _certificates = newCertificates;
    notifyListeners();
  }
}
