import 'package:flutter/material.dart';

enum Categories {
  ai,
  dao,
  defi,
  dex,
  gaming,
  layer1,
  layer2,
  meme,
  nft,
  oracle,
  privacy,
  stablecoins,
}

class Category {
  final String title;
  final Color color;
  const Category(this.title, this.color);
}