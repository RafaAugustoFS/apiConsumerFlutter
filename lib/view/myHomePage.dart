import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _getData(int id) async {
    var url = Uri.https(
        'fakestoreapi.com', '/products', {'q': '{https}'});

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
            jsonResponse.forEach(
              (produto) =>{
                print(produto['title']),
                print(produto['price']),
                print(produto['image']),
                });
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    

    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Container(
              width: 200,
              height: 66.6,
              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              child: Text('data'),
            ),
            Container(
              width: 200,
              height: 66.6,
              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              child: Text('data'),
            ),
            Container(
              width: 200,
              height: 66.5,
              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              child: Text('data'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getData(_counter);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
