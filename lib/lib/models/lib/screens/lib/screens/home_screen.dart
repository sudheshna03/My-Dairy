import 'package:flutter/material.dart';
import '../models/diary_entry.dart';
import 'add_entry_screen.dart';
import 'view_entry_screen.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback toggleTheme;
  final List<DiaryEntry> entries;
  final Function(DiaryEntry) onAdd;
  final bool darkMode;

  const HomeScreen({
    required this.toggleTheme,
    required this.entries,
    required this.onAdd,
    required this.darkMode,
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Diary"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(widget.darkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: widget.toggleTheme,
          )
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: widget.darkMode
                  ? [Colors.purpleAccent.shade100, Colors.deepPurple]
                  : [Colors.deepPurple, Colors.purpleAccent],
            ),
          ),
        ),
      ),
      body: widget.entries.isEmpty
          ? const Center(
              child: Text(
                "No entries yet.\nTap + to add your first memory ✨",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: widget.entries.length,
              itemBuilder: (context, i) {
                final e = widget.entries[i];
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    leading: const Icon(Icons.bookmark, color: Colors.purple),
                    title: Text(e.title,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(e.date),
                    trailing: const Icon(Icons.arrow_forward_ios,
                        size: 16, color: Colors.grey),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => ViewEntryScreen(entry: e)),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final newEntry = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddEntryScreen()),
          );
          if (newEntry != null) widget.onAdd(newEntry);
        },
        icon: const Icon(Icons.add),
        label: const Text("New Entry"),
      ),
    );
  }
}
