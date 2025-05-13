import 'package:flutter/material.dart';

class PayrollDetailPage extends StatelessWidget {
  const PayrollDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Payroll Detail")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Month: April 2025"),
            SizedBox(height: 8),
            Text("Basic Salary: RM 3000"),
            Text("Allowances: RM 500"),
            Text("Deductions: RM 100"),
            SizedBox(height: 12),
            Text("Net Pay: RM 3400", style: TextStyle(fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}