import 'package:flutter/material.dart';
import 'profileapp.dart';
import 'profiledata.dart';

void main() {
  runApp(
    MaterialApp(
      home: ProfileApp(
        profileData: ProfileData(
          name: "Rom SMOS",
          position: "Flutter Developer",
          avatarUrl: 'https://i.pinimg.com/736x/71/fb/d3/71fbd3221a91249ebf304fced7365ecd.jpg',
          titles: [
            TileData(
              icon: Icons.phone,
              title: "Phone Number",
              data: "+85512 900 800",
            ),
            TileData(
              icon: Icons.location_on,
              title: "Address",
              data: "Cambodia",
            ),
          ],
        ),
      ),
    ),
  );
}
