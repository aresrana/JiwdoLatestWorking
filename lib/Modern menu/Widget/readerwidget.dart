import 'package:flutter/material.dart';
import 'package:jiwdopani/Modern menu/model/card.dart';
import 'package:jiwdopani/UserMenuOption/JpSelect.dart';
import 'package:get/get.dart';
import 'package:jiwdopani/Modern menu/Widget/readVerse.dart';
class ReaderWidget extends StatelessWidget {
  List<CardItem> items = [
    CardItem(
      urlImage: 'assets/promise.jpg',
      title: 'Jiwdo Pani',
      GoTap: ()=> Get.to(JpSelect()),

    ),
    CardItem(
      urlImage: 'assets/promise.jpg',
      title: 'Precious Seed',
      GoTap: ()=> Get.to(ReadVerse()),

    ),
    CardItem(
      urlImage: 'assets/promise.jpg',
      title: 'Daily Devotion',

    ),
    CardItem(
      urlImage: 'assets/promise.jpg',
      title: 'Daily Promise',

    ),
    CardItem(
      urlImage: 'assets/promise.jpg',
      title: 'Read Books',

    )


  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height*0.20,
    child: ListView.separated(
    padding: EdgeInsets.all(16),
    scrollDirection: Axis.horizontal,
    itemCount:5,
    separatorBuilder: (context,_)=> SizedBox(width: 12),
    itemBuilder: (context,index) => buildCard(item:items[index]),
    ));


  }

}
Widget buildCard({
  CardItem item,
   }) =>
    Container(
      //height:150 ,
      width: 150,
      child: Column(
        children: [
          Expanded(
              //child: AspectRatio(
          //aspectRatio:4/5 ,
         child : ClipRRect(
           borderRadius : BorderRadius.circular(10),
         child: Ink.image(
                image:AssetImage(
              item.urlImage,),
          //height: 10,
          //width: 100,
          fit: BoxFit.cover,
           child: InkWell(
             onTap: item.GoTap
           ),
      )
          ))
//)
,
      SizedBox( height:6 ),
          Text(item.title)
        ],
      ),


    );

