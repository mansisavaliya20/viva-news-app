import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/news_provider.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool book = false;

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        actions: [
          Icon(
            Icons.favorite_border,
            color: Colors.white,
          ),
          SizedBox(
            width: w * 0.02,
          ),
          Icon(
            Icons.share,
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {
              Provider.of<BookMark_Provider>(context, listen: false)
                  .BoockMark(data['title']);
            },
            icon: Icon(
              Icons.bookmark_border,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Text(
                      "${data['title']}",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      height: h * 0.035,
                    ),
                    Container(
                      height: h * 0.3,
                      width: w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: (data['urlToImage'] != null)
                            ? DecorationImage(
                                image: NetworkImage(data['urlToImage']),
                                fit: BoxFit.cover,
                              )
                            : DecorationImage(
                                image: AssetImage("assets/images/news.png"),
                                fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.05,
              ),
              Container(
                height: h * 0.6,
                width: w,
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: h * 0.008,
                    ),
                    Container(
                      height: h * 0.005,
                      width: w * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Text(
                            "${data['publishedAt'].toString().split("T")[0]}  ${data['publishedAt'].toString().split("T")[1].split("Z")[0]} s",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: h * 0.023),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Text(
                            "Author : ${data['author']}",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, bottom: 8),
                      child: Row(
                        children: [
                          (data['source']['id'] != null)
                              ? Text(
                                  "Source : ${data['source']['id']}",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                )
                              : Text(
                                  "Source : CNBCTV18",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, bottom: 8, right: 15),
                      child: (data['description'] != null)
                          ? Text(
                              "${data['description']}",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            )
                          : Text(
                              "he term business refers to an organization or enterprising entity engaged in commercial, industrial, or professional activities. The purpose of a business is to organize some sort of economic production of goods or services.",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, bottom: 8, right: 15),
                      child: (data['content'] != null)
                          ? Text(
                              "${data['content']}",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            )
                          : Text(
                              "Business information comes in general surveys, data, articles, books, references, search-engines, and internal records that a business can use to guide its planning, operations, and the evaluation of its activities.",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
