import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();}
class _HomeScreenState extends State<HomeScreen> {
  var newslist = [];
  @override
  void initState() {
    super.initState();
    fetchNews();}
  fetchNews() async {
    final result = await http.get(Uri.parse("https://newsapi.org/v2/everything?q=sports&apiKey=4a227bc8fa5540f389918c85be70cd8d"));
final response = jsonDecode(result.body);
 var news = response['articles'];
setState(() {
  newslist = news;
print(newslist);
});}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
        centerTitle: true,),
body: ListView.builder(
        itemCount: newslist.length,
        itemBuilder: (BuildContext context,int index) {
          return Card(
            color:Colors.yellow ,
            child: Column(
              children: [
                Text(newslist[index]["title"]),
                Image.network(newslist[index]["urlToImage"]),
              ],),);
        },
      ),
    );
  }
}
