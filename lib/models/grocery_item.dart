import 'package:flutter/material.dart';

enum Importance {
  low,
  medium,
  high,
}

class GroceryItem {
  final String id;
  final String name;
  final Importance importance;
  final Color color;
  final int quantity;
  final DateTime date;
  final bool isComplete;

  GroceryItem({
    required this.id,
    required this.name,
    required this.importance,
    required this.color,
    required this.quantity,
    required this.date,
    this.isComplete = false,
  });

  //copyWith creates a copy and a completely new instance of GroceryItem
  //useful for managing the state of the item (later)
  GroceryItem copyWith({
    String? id,
    String? name,
    Importance? importance,
    Color? color,
    int? quantity,
    DateTime? date,
    bool? isComplete,
  }) {
    return GroceryItem(
        id: id ?? this.id,
        name: name ?? this.name,
        importance: importance ?? this.importance,
        color: color ?? this.color,
        quantity: quantity ?? this.quantity,
        date: date ?? this.date,
    );
  }
}