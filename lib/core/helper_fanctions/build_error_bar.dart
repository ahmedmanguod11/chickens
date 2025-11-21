
  import 'package:flutter/material.dart';

void buildErrorbar(BuildContext context, String massage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(massage),
        backgroundColor: Colors.red,
        showCloseIcon: true,
        
      ),
    );
  }

