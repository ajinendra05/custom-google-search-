// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:google_flutter/colors.dart';
import 'package:google_flutter/services/api_service.dart';
import 'package:google_flutter/widgets/search_footer.dart';

import '../widgets/search_header.dart';
import '../widgets/search_result_component.dart';
import '../widgets/search_tabs.dart';

class SearchScreen extends StatelessWidget {
  final String searchQuery;
  final String start;
  const SearchScreen({
    Key? key,
    required this.searchQuery,
    required this.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Title(
      color: Colors.blue,
      title: searchQuery,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //web header
                const SearchHeader(),
                //tabs for new images etc
                Padding(
                  padding:
                      EdgeInsets.only(left: size.width <= 768 ? 10 : 150.0),
                  child: const SingleChildScrollView(
                      scrollDirection: Axis.horizontal, child: SearchTabs()),
                ),
                const Divider(
                  height: 0,
                  thickness: 0.5,
                ),
                //search results components
                FutureBuilder(
                  future: ApiService().fetchData(
                    queryTerm: searchQuery,
                    start: start,
                  ),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  left: size.width <= 768 ? 10 : 150,
                                  top: 12,
                                ),
                                child: Text(
                                  'About ${snapshot.data?['searchInformation']['formattedTotalResults']} results (${snapshot.data?['searchInformation']['formattedSearchTime']} seconds)',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF70757A),
                                  ),
                                ),
                              ),
                              ListView.builder(
                                  itemCount: snapshot.data?['items'].length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 10,
                                              left:
                                                  size.width <= 768 ? 10 : 150),
                                          child: SearchResultComponent(
                                            desc: snapshot.data?['items'][index]
                                                ['snippet'],
                                            link: snapshot.data?['items'][index]
                                                ['formattedUrl'],
                                            linkToGo: snapshot.data?['items']
                                                [index]['link'],
                                            text: snapshot.data?['items'][index]
                                                ['title'],
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                              SizedBox(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        if (start != "0") {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SearchScreen(
                                                searchQuery: searchQuery,
                                                start: (int.parse(start) - 10)
                                                    .toString(),
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                      child: const Text(
                                        '< Prev',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: blueColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => SearchScreen(
                                              searchQuery: searchQuery,
                                              start: (int.parse(start) + 10)
                                                  .toString(),
                                            ),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        'Next >',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: blueColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const SearchFooter(),
                            ],
                          ),
                        ],
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),

                //pagination button
              ]),
        ),
      ),
    );
  }
}
