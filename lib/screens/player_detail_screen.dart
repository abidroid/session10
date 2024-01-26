import 'package:flutter/material.dart';
import 'package:session10/models/player.dart';

class PlayerDetailScreen extends StatelessWidget {
  final Player player;

  const PlayerDetailScreen({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Player Details'),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Text(player.image,textAlign: TextAlign.center, style: TextStyle(fontSize: 180),),
        Text(player.name, textAlign: TextAlign.center,style: TextStyle(fontSize: 40),),
        Text(player.role, textAlign: TextAlign.center,style: TextStyle(fontSize: 40),),
        Text(player.country,textAlign: TextAlign.center, style: TextStyle(fontSize: 40),),

      ],),
    );
  }
}
