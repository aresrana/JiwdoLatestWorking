import 'package:flutter/material.dart';
import 'package:jiwdopani/Modern menu/model/card.dart';
import 'package:jiwdopani/UserMenuOption/JpSelect.dart';
import 'package:get/get.dart';

class UserAccess extends StatelessWidget {
  List<CardItem> items = [
    CardItem(
      urlImage: 'assets/promise.jpg',
      title: 'Uploads',
      GoTap: () => Get.to(JpSelect()),
    ),
    CardItem(
      urlImage: 'assets/promise.jpg',
      title: 'Submit Feedback',
    ),
    CardItem(
      urlImage: 'assets/promise.jpg',
      title: 'Address Book',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.2,
        child: ListView.separated(
          padding: EdgeInsets.all(5),
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          separatorBuilder: (context, _) => SizedBox(width: 12),
          itemBuilder: (context, index) => buildCard(item: items[index]),
        ));
  }
}

Widget buildCard({
  CardItem item,
}) =>
    Container(
      width: 150,
      child: Column(
        children: [
          Expanded(
             child:ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),


                //padding: EdgeInsets.all(20),
                child: Ink.image(
              image: AssetImage(item.urlImage),
              fit: BoxFit.cover,
              child: InkWell(onTap: item.GoTap),
            )),
          ),
          SizedBox(height: 6),
          Text(item.title)
        ],
      ),
    );
