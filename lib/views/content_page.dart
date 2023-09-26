import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Image.network(
                    'https://i0.wp.com/cornellsun.com/wp-content/uploads/2023/04/02-smb-dm-mobile-banner-1080x745-pl-f01-022723-63fe3cbc4df54-1.jpg?fit=1080%2C720&ssl=1'),
              ),
              Container(
                child: RichText(
                    text: TextSpan(
                        text: "Synopsis",
                        style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                              text:
                              " \n\ While working underground to fix the water main,Brooklyn plumbers-and brothers-Mario and Luigi are transported down a mysterious pipe and wander into a magical new world.But when the brothers are seperated,Mario embarks on an epic quest to find Luigi")
                        ])),
              ),
              Container(child:Row(
                children: [
                  RichText(text: TextSpan(text: "Cast",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold)),),
                ],
              ),),
              Container(child:Row(mainAxisAlignment:MainAxisAlignment.spaceAround,children: [Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQM5VuXExf3RpJpzIZZmfHPS8yPem5JtlHVHg&usqp=CAU',fit: BoxFit.cover,),Text('Chris Pratt'),
                Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjs0rwdxhkKhxLxBpYqQKbW3Huzp0dTJrORw&usqp=CAU',fit: BoxFit.fill,),Text('Anya Taylor-Joy')],),)
        ],),),);
  }

}
