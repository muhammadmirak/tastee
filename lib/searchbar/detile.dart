import 'package:flutter/material.dart';
import './data_page.dart';

class Detail extends StatefulWidget {
  final ListWords listWordsDetail;

  Detail({Key key, @required this.listWordsDetail}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    Widget _buildContainerText(
        String text, String text1, String text2, String text3, var image) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: GestureDetector(
                onTap: () {
                  //   Navigator.of(context).push(
                  //     MaterialPageRoute(
                  //       builder: (ctx) => DetailScreen(
                  //         foodImage: pasta.foodImage,
                  //         foodName: pasta.foodName,
                  //         foodPrice: pasta.foodPrice,
                  //         foodType: pasta.foodType,
                  //       ),
                  //     ),
                  //   );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 180,
                  width: 170,
                  color: Color(0xffffffff),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                text,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(text1),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Text("$text2 Rating"),
                              Text(
                                "\$$text3",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight
                                    .bold,
                                    color: Color(0xff03d4ee)),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: CircleAvatar(
                maxRadius: 65,
                backgroundImage: NetworkImage(image),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: const Text('Détail', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: GridView.count(
        padding: EdgeInsets.only(top: 10),
        crossAxisCount: 2,
        childAspectRatio: 0.70,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: <Widget>[
          _buildContainerText(
            "pasta", "sui star hotel", "3.2", "45.5",
            "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2017/09/spaghetti-bolognese.jpg?itok=KzT6QRKe",
          ),
          _buildContainerText(
            "pasta", "sui star hotel", "3.2", "45.5",
            "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2017/09/spaghetti-bolognese.jpg?itok=KzT6QRKe",
          ),
        ],
      ),
    );
  }
}
