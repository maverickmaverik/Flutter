import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class ListItem extends StatelessWidget {
  final String title;
  final String content;
  final String docId;
  final AuthService authService;

  const ListItem({
    super.key,
    required this.title,
    required this.content,
    required this.docId,
    required this.authService,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(docId),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16.0),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) => authService.deleteNote(docId),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 0.5,
                height: 16,
              ),
              Text(
                content,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
