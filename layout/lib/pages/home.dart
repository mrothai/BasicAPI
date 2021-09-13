import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';

class HomePage extends StatefulWidget {
  // const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ความรู้เกียวกับคอมพิวเตอร์"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        // child: ListView(
        //   children: [
        //     MyBox(
        //         "คอมพิวเตอร์คืออะไร?",
        //         "คอมพิวเตอร์ คือ ปุกรณ์ที่ใช้สำหรับการคำนวณและทำงานอื่นๆ",
        //         "https://cdn.pixabay.com/photo/2015/01/09/02/45/laptop-593673_960_720.jpg"),
        //     SizedBox(
        //       height: 10,
        //     ),
        //     MyBox("มาเขียนโปรแกรม", "แนะนำการเริ่มต้นเขียนโปรแกรม",
        //         "https://cdn.pixabay.com/photo/2018/08/10/15/45/woman-3597101_960_720.jpg"),
        //     SizedBox(
        //       height: 10,
        //     ),
        //     MyBox("Flutter คือ?", "Tools สำหรับการออกแบบ",
        //         "https://cdn.pixabay.com/photo/2015/12/11/09/30/mobile-phone-1087845_960_720.jpg"),
        //   ],
        // ),
        child: FutureBuilder(
          builder: (context, snapshot) {
            var data = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return MyBox(data[index]['title'], data[index]['subtitle'],
                    data[index]['image_url'], data[index]['detail']);
              },
              itemCount: data.length,
            );
          },
          future: DefaultAssetBundle.of(context).loadString('assets/data.json'),
        ),
      ),
    );
  }

  Widget MyBox(String title, String subtitle, String image_url, String detail) {
    var v1, v2, v3, v4;
    v1 = title;
    v2 = subtitle;
    v3 = image_url;
    v4 = detail;

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(20),
      //  color: Colors.blue[50],
      height: 200,
      decoration: BoxDecoration(
        // color: Colors.blue[50],
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(image_url),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.25), BlendMode.darken),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            subtitle,
            style: TextStyle(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {
                print("Next Page >>>");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(v1, v2, v3, v4)));
              },
              child: Text(
                "อ่านต่อ",
                style: TextStyle(color: Colors.yellow),
              ))
        ],
      ),
    );
  }
}
