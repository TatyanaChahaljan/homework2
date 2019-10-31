import 'dart:math';
import 'package:cats/pages/image_details_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _numGenerator = Random();

  final List<String>  _todoItems = [
    'resources/cats/1.jpg', 
      'resources/cats/2.jpg', 
      'resources/cats/3.jpg', 
      'resources/cats/4.jpg', 
      'resources/cats/5.jpg', 
      'resources/cats/6.jpg', 
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: 
        GridView.builder(
          itemCount: _todoItems.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {     
              return Container(                     
                padding: const EdgeInsets.all(5.0),
                child: _buildImageNavigator(_todoItems[index])
              );
          },
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _pushAddTodoScreen(),
        tooltip: 'Random picture',
        child: Icon( Icons.image),
      ) ,
    );
  }

  Widget _buildImageNavigator(String url) {
    return  Ink.image(
        image:  AssetImage(url),
        fit: BoxFit.cover,
        child: InkWell(
        onTap: () {
              Navigator.of(context).push<dynamic>(
                MaterialPageRoute<dynamic>(
                  builder: (context) =>  ImageDetailsPage(assetPath:url,)
                )
              );
          }),
      );
  }

  void _pushAddTodoScreen() {
    Navigator.of(context).push<dynamic>(
       MaterialPageRoute<dynamic>(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Random picture')
            ),
              body: Center(
                 child: Image.network('https://picsum.photos/400?image=${_numGenerator.nextInt(100)}'),
              )
          );
        }
      )
    );
  }

}
