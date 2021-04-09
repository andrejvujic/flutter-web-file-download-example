import 'dart:convert';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// This app is working example on how to download
/// files from the network with Flutter Web
void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// These are the example images that will
  /// be shown in the GridView
  final imageUrls = <String>[
    'https://images.pexels.com/photos/208745/pexels-photo-208745.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://images.pexels.com/photos/1470707/pexels-photo-1470707.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://images.pexels.com/photos/2671089/pexels-photo-2671089.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://images.pexels.com/photos/2670273/pexels-photo-2670273.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 3,
        children: imageUrls
            .map(
              (imageUrl) => ImageCard(imageUrl: imageUrl),
            )
            .toList(),
      ),
    );
  }
}

class ImageCard extends StatefulWidget {
  @override
  _ImageCardState createState() => _ImageCardState();

  final String imageUrl;
  ImageCard({
    @required this.imageUrl,
  });
}

class _ImageCardState extends State<ImageCard> {
  Future<void> download(String url) async {
    /// This is the function that downloads the image
    /// from the given image url
    try {
      /// First make a GET request to the given url
      final http.Response r = await http.get(
        Uri.parse(url),
      );

      /// Then get the bytes from the response's body
      final data = r.bodyBytes;

      /// And base64 encode them
      final base64data = base64Encode(data);

      /// Create an anchor element
      /// Note: you should change the mime type depending on the
      /// type of file you are downloading, since I'm using images
      /// mine is image/jpeg
      final a = html.AnchorElement(href: 'data:image/jpeg;base64,$base64data');

      /// Set the name of the file we want to download the file to
      a.download = 'download.jpg';
      a.click();
      a.remove();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => download(widget.imageUrl),
      child: Card(
        child: Image.network(
          widget.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
