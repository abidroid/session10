import 'package:flutter/material.dart';
import 'package:session10/data_store/data_store.dart';
import 'package:session10/models/player.dart';
import 'package:session10/screens/player_detail_screen.dart';
import 'package:session10/screens/second_screen.dart';
import 'package:session10/screens/third_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  TextEditingController nameC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            TextField(
              controller: nameC,
              decoration: const InputDecoration(
                hintText: 'Your name',
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () {

                String name = nameC.text.trim();

                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return SecondScreen(name: name);
                }));

              },
              child: const Text('Go to 2nd Screen'),
            ),

            ElevatedButton(
              onPressed: () {

                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return ThirdScreen(name: nameC.text.trim());
                }));
              },
              child: const Text('Go to 3rd Screen'),
            ),

            Expanded(
              child: ListView.builder(
                  itemCount: players.length,
                  itemBuilder: (context, index){

                    Player player = players[index];

                    return Card(child: ListTile(
                      leading: Text(player.image, style: const TextStyle(fontSize: 30),),
                      title: Text(player.name),
                      subtitle: Text(player.role),
                      trailing: Text(player.country),
                      onTap: (){

                        Navigator.of(context).push(MaterialPageRoute(builder: (context){

                          return PlayerDetailScreen(player: player);
                        }));

                      },
                    ),);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
