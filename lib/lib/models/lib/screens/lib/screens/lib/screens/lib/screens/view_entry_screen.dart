import 'package:flutter/material.dart';
import '../models/diary_entry.dart';

class ViewEntryScreen extends StatelessWidget {
  final DiaryEntry entry;
  const ViewEntryScreen({required this.entry, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(entry.title), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [Colors.purple.shade50, Colors.purple.shade100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(entry.date,
                  style: const TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.grey)),
              const SizedBox(height: 12),
              Text(entry.content,
                  style: const TextStyle(fontSize: 18, height: 1.4, letterSpacing: 0.2)),
            ],
          ),
        ),
      ),
    );
  }
}
