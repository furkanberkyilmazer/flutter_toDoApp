import 'package:flutter/material.dart';
import 'package:to_do_app/models/items_data.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/items_data.dart';
class ItemAdder extends StatelessWidget {
  final textController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom), //klavyeyi ekranın görünmeyen boş kısmı kadar açıyor.

      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, //içindeki elemanları genişletir
          children: [
            Expanded(
              child: TextField(
                minLines: 1,
                maxLines: 3,
                controller: textController,
                onChanged: (input){

                  print(textController.text);
                },
                style: TextStyle(color: Colors.black,
                fontSize: 20),
                decoration: InputDecoration(

                  border:OutlineInputBorder(),labelText: 'Add Item',
                  hintText: '...',
                ),

                autofocus: true,
              ),
            ),
            TextButton(
              onPressed: (){
                Provider.of<ItemData>(context,listen: false).addItem(textController.text);
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(backgroundColor: Theme.of(context).accentColor),
              child: Text('ADD',style: TextStyle(color: Colors.black),),
            ),

          ],
        ),
      ),
    );
  }
}
