import 'package:flutter/material.dart';

import '../../Helper/api_helper.dart';
import '../../Model/news_modal.dart';

class HealthPage extends StatefulWidget {
  const HealthPage({super.key});

  @override
  State<HealthPage> createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  late Future<NewsModel?> getNews;
  @override
  void initState() {
    super.initState();
    getNews = APIHelper.apiHelper.fetchApi("us", "health");
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return FutureBuilder(
      future: getNews,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("ERROR : ${snapshot.error}"),
          );
        } else if (snapshot.hasData) {
          NewsModel? data = snapshot.data;
          return Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Column(
              //     children: [
              //       SingleChildScrollView(
              //         scrollDirection: Axis.horizontal,
              //         child: Row(
              //           children: [
              //             ...List.generate(
              //               Countryname.length,
              //               (i) => GestureDetector(
              //                 onTap: () {
              //                   setState(() {
              //                     getNews = APIHelper.apiHelper
              //                         .fetchApi(Countryname[i], "business");
              //                   });
              //                 },
              //                 child: Container(
              //                   height: h * 0.04,
              //                   width: w * 0.22,
              //                   margin: EdgeInsets.all(5),
              //                   decoration: BoxDecoration(
              //                     color: Colors.grey.shade100,
              //                     borderRadius: BorderRadius.circular(20),
              //                   ),
              //                   alignment: Alignment.center,
              //                   child: Text(
              //                     Countryname[i],
              //                     style: TextStyle(color: Colors.black),
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Expanded(
                child: ListView.builder(
                  itemCount: data?.articles.length,
                  itemBuilder: (context, i) => Padding(
                    padding: const EdgeInsets.all(20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed("second_page",
                            arguments: data?.articles[i]);
                      },
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: h * 0.05,
                                width: w * 0.5,
                                child: Text(
                                  "${data?.articles[i]['title']}",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                height: h * 0.01,
                              ),
                              Container(
                                height: h * 0.1,
                                width: w * 0.5,
                                child: (data?.articles[i]['content'] != null)
                                    ? Text(
                                        "${data?.articles[i]['content']}",
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    : Text(
                                        "Business information comes in general surveys, data, articles, books, references, search-engines, and internal records that a business can use to guide its planning, operations, and the evaluation of its activities.",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                              ),
                            ],
                          ),
                          (data?.articles[i]['urlToImage'] != null)
                              ? Image.network(
                                  data?.articles[i]['urlToImage'],
                                  height: 150,
                                  width: 150,
                                )
                              : Image.asset(
                                  "assets/images/news.png",
                                  height: 150,
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
