import 'package:flutter/material.dart';

class ProfileData {
  final String name;
  final String position;
  final String? avatarUrl;
  final List<TileData> titles;

  ProfileData({
    required this.name,
    required this.position,
    this.avatarUrl,
    required this.titles,
  });
}

class TileData {
  final IconData icon;
  final String title;
  final String data;

  TileData({
    required this.icon,
    required this.title,
    required this.data,
  });
}
