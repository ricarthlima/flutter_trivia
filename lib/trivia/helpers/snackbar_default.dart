import "package:flutter/material.dart";

showSnackBarDefault(BuildContext context, String text) {
  SnackBar snackBar = SnackBar(
    content: Text(
      text,
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.grey[800],
    duration: const Duration(milliseconds: 1250),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
