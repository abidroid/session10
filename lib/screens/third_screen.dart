import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {

  final String name;
  const ThirdScreen({super.key, required this.name});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late int num1, num2;
  int result = 0;

  String passwordMessage = 'Type a password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Third Screen ${widget.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: ListView(children: [
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'First Number',
                border: OutlineInputBorder(),
              ),
              validator: (text){
                if( text == null || text.isEmpty){
                  return 'Please provide First Number';
                }

                if( text.length < 2 ){
                  return 'Please provide a number with 2 or more digits';
                }

                // when text is valid

                num1 = int.parse(text);
                return null;
              },
            ),
            const SizedBox(height: 16,),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const  InputDecoration(
                hintText: 'Second Number',
                border: OutlineInputBorder(),
              ),
              validator: (text){
                if( text == null || text.isEmpty){
                  return 'Please provide Second number';
                }

                if( text.length < 2 ){
                  return 'Please provide a number with 2 or more digits';
                }

                num2 = int.parse(text);
                return null;
              },
            ),
            const SizedBox(height: 16,),

            ElevatedButton(onPressed: (){

              if( formKey.currentState!.validate()){

                  setState(() {
                    result = num1+num2;
                  });

              }

            }, child: const Text('Add')),
            ElevatedButton(onPressed: (){
              formKey.currentState!.reset();

              setState(() {
                result = 0;
              });
            }, child: const Text('Clear')),

            Text(result.toString()),

            TextFormField(
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
              ),
              onChanged: (String text){

                setState(() {

                  if( text.isEmpty){
                    passwordMessage = 'Please Type a Password';
                  }
                  else if( text.length <= 6){
                    passwordMessage = 'Weak Password';
                  }
                  else if( text.length <= 10){
                    passwordMessage = 'Average Password';
                  }else if( text.length > 10){

                    if( validateEmail(text)){
                      passwordMessage = 'Valid Password';
                    }else{
                      passwordMessage =  'Invalid Password';
                    }

                  }
                });

              },
            ),

            const SizedBox(height: 16,),
            Text(passwordMessage),

          ],),
        ),
      ),
    );
  }

  bool validateEmail(String value){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
