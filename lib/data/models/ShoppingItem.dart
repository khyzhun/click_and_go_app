import 'package:flutter/material.dart';

class ShoppingItem {

  ShoppingItem({
    this.id,
    this.title,
    this.price,
    this.amount,
    this.totalPrice
  });

  int id;
  String title;
  double price;
  int amount;
  double totalPrice;

}
