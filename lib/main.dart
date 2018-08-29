import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


void main() {
  debugPaintSizeEnabled=false;
 runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Cafe Umami',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                  ),
                ),
                Text(
                  'Oakland, California',
                  style: TextStyle(color: Colors.grey[500], fontSize: 16.0),
                ),
              ],
            ),
          ),
          FavoriteWidget()
        ],
      ),
    );

    Column buildButtonColumn(IconData icon, String label){
      Color color = Theme.of(context).primaryColor;

      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400, color: color),
            ),
          ),
        ],
      );
    }

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        mainAxisSize: MainAxisSize.min,

        children: [
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        '''A loanword from the Japanese (うま味), umami can be translated as "pleasant savory taste".  Umami, or savory taste, is one of the five basic tastes (together with sweetness, sourness, bitterness, and saltiness).   It has been described as brothy or meaty.''',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Layout Practice',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Best in The Bay'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/umami.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
}

class FavoriteWidget extends StatefulWidget{
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget>{
  bool _isFavorited = true;
  int _favoriteCount = 25;

  void _toggleFavorite(){
    setState(() {
      if(_isFavorited){
        _favoriteCount -= 1;
        _isFavorited = false;
      } else{
        _favoriteCount +=1;
        _isFavorited = true;
      }
    });
  }
  
  Widget build(BuildContext context){
    return Row(
      mainAxisSize: MainAxisSize.min,
      
      children: [
        Container(
          padding: EdgeInsets.all(0.0),
          child: IconButton(
              icon: (_isFavorited ? Icon(Icons.star, color: Colors.pink,) : Icon(Icons.star_border, color: Colors.pink)),
              onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18.0,
          child: Container(
            child: Text('$_favoriteCount', style: TextStyle(color: Colors.pink, fontWeight: FontWeight.w600),),
          ),
        ),
      ],
    );
  }
  
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'Test',
            ),
            new Text(
              'Also Test',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
    );
  }
}
