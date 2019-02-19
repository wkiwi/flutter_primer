import 'package:flutter/material.dart';
import '../model/post.dart';

class SliverDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
            SliverAppBar(
              title: Text('wkiwi'),
              // pinned: true,
              floating: true,
              expandedHeight: 178.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'wkiwi'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 15.0,
                    letterSpacing: 3.0,
                    fontWeight: FontWeight.w400
                  ),
                ),
                background: Image.network(
                  'https://resources.ninghao.org/images/candy-shop.jpg',
                  fit:BoxFit.cover
                ),
              ),
            ),
            SliverSafeArea(
              sliver: SliverPadding(
              padding: EdgeInsets.all(8.0),
              sliver: SliverGridDemo(),
            ),
          ),
        ],
      ),
    );
  }
}

class SliverGridDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1.0
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext contexy, int index){
          return Container(
            child: Image.network(
              posts[index].imageUrl,
              fit: BoxFit.cover,
            ),
          );
        },
        childCount: posts.length
      ),

    );
  }
}