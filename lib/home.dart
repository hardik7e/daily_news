import 'package:daily_news/helper/categoryCardsData.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<categoryCards> categories = new List<categoryCards>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories().cast<categoryCards>();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Daily'),
            Text('News', style: TextStyle(color: Colors.blue,),)
          ],
        ),
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: Container(
          child: Column(
            children: [
              Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: categories.length,
                    itemBuilder: (context, index){
                      return categoryCards(
                        imageUrl: categories[index].imageUrl,
                        categoryName: categories[index].categoryName,
                      );
                    }),
              )
            ],
          ),
      ),
    );
  }
}


class categoryCards extends StatelessWidget {

  final imageUrl, categoryName;
  categoryCards({this.imageUrl,this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image.network(imageUrl, width: 120, height: 60,),
        ],
      )
    );
  }
}

