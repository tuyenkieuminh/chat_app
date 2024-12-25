import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SendMessage extends StatelessWidget {
  const SendMessage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _messageInputController = TextEditingController();

    void _submit() {
      String text = _messageInputController.text;
      if(text.isEmpty || text.trim().isEmpty) {
        return;
      }

      // FirebaseDatabase.instance.ref()
      
      _messageInputController.clear();
    }
    
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageInputController,
              decoration: const InputDecoration(
                labelText: "Send a message.."
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
          IconButton(onPressed: _submit, icon: const Icon(Icons.send), color: Theme.of(context).colorScheme.primary,)
        ],
      ),
    );
  }
}