import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    final faqs = [
      {"question": "How to apply for leave?", "answer": "Go to Leave > Apply Leave and fill in the form."},
      {"question": "How do I reset my password?", "answer": "Use the 'Forgot Password' link on the login page."},
    ];

    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          final item = faqs[index];
          return ExpansionTile(
            title: Text(item["question"]!),
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(item["answer"]!),
              )
            ],
          );
        },
      ),
    );
  }
}
