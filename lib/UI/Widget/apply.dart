import 'package:flutter/material.dart';

void showApplyConfirmationDialog({
  required BuildContext context,
  required VoidCallback onConfirm,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text("Apply to this Role"),
        content: Text(
          "Apply to this role using your profile resume.\nNeed to edit any changes?",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel", style: TextStyle(color: Colors.red)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
              onConfirm(); // Trigger the apply action

              // Show success message after applying
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Application Successful"),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: const Text("Proceed", style: TextStyle(color: Colors.green)),
          ),
        ],
      );
    },
  );
}
