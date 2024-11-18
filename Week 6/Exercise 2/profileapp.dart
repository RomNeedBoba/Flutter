import 'package:flutter/material.dart';
import 'profiledata.dart';

class ProfileApp extends StatelessWidget {
  final ProfileData profileData;

  const ProfileApp({Key? key, required this.profileData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CADT Student Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.blue[100],
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: profileData.avatarUrl != null
                        ? NetworkImage(profileData.avatarUrl!)
                        : null,
                    child: profileData.avatarUrl == null
                        ? Icon(
                            Icons.person,
                            size: 50,
                          )
                        : null,
                  ),
                  SizedBox(height: 10),
                  Text(
                    profileData.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    profileData.position,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),

            ...profileData.titles.map((tile) => ProfileTile(tileData: tile)).toList(),
          ],
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final TileData tileData;

  const ProfileTile({Key? key, required this.tileData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(tileData.icon),
        title: Text(tileData.title),
        subtitle: Text(tileData.data),
      ),
    );
  }
}
