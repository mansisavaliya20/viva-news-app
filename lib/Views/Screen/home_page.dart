import 'package:flutter/material.dart';
import 'package:news_headlines/Views/Screen/sport_page.dart';
import 'package:provider/provider.dart';

import '../../Model/news_modal.dart';
import '../../Provider/news_provider.dart';
import 'bussiness_page.dart';
import 'health_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List Countryname = ["in", "us", "kr"];
  late Future<NewsModel?> getNews;
  @override
  Widget build(BuildContext context) {
    int moreserch = 1;
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            "News App",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          leading: PopupMenuButton<int>(
            color: Colors.white,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Text("India"),
              ),
              PopupMenuItem(
                value: 2,
                child: Text("America"),
              ),
              PopupMenuItem(
                value: 3,
                child: Text("Koria"),
              ),
            ],
          ),
          actions: [
            IconButton(
              color: Colors.white,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  //backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                  ),
                  builder: (context) => Container(
                      height: h,
                      width: w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: ListView.builder(
                        itemCount: Provider.of<BookMark_Provider>(context)
                            .m1
                            .BookMark
                            .length,
                        itemBuilder: (context, i) => Padding(
                          padding: const EdgeInsets.all(15),
                          child: ListTile(
                            title: Text(
                              Provider.of<BookMark_Provider>(context)
                                  .m1
                                  .BookMark[i],
                              style: TextStyle(
                                color: Colors.grey.shade800,
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Provider.of<BookMark_Provider>(context,
                                        listen: false)
                                    .RemoveBookmark(i);
                              },
                              icon: Icon(Icons.clear),
                            ),
                          ),
                        ),
                      )),
                );
              },
              icon: Icon(
                Icons.menu,
              ),
            ),
            SizedBox(
              width: w * 0.02,
            )
          ],
          bottom: TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              tabs: [
                Tab(
                  text: "HEALTH",
                ),
                Tab(
                  text: "BUSINESS",
                ),
                Tab(
                  text: "SPORTS",
                ),
              ]),
        ),
        body: TabBarView(
          children: [
            HealthPage(),
            BusinessPage(),
            SportsPage(),
          ],
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
