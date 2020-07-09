import 'package:flutter/material.dart';
import './detile.dart';
import './data_page.dart';

class DataSearch extends SearchDelegate<String> {
  final List<ListWords> listWords;

  DataSearch(this.listWords);

  @override
  List<Widget> buildActions(BuildContext context) {
    //Actions for app bar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on the left of the app bar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on the selection
    final suggestionList = listWords;

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text(listWords[index].titlelist),
        subtitle: Text(listWords[index].definitionlist),
      ),
      itemCount: suggestionList.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something

    final suggestionList = query.isEmpty
        ? listWords
        : listWords
            .where((p) =>
                p.titlelist.contains(RegExp(query, caseSensitive: false)))
            .toList();

    return ListView.builder(
      itemBuilder: (context, index) => Column(
        children: <Widget>[
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Detail(listWordsDetail: suggestionList[index]),
                ),
              );
            },

            //   trailing: Icon(Icons.remove_red_eye),
            //   title: RichText(
            //     text: TextSpan(
            //       text: suggestionList[index].titlelist.substring(0, query.length),
            //       style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            //       children: [
            //         TextSpan(
            //             text: suggestionList[index].titlelist.substring(query.length),
            //             style: TextStyle(color: Colors.grey)),
            //       ],
            //     ),
            //   ),
            // ),
            // itemCount: suggestionList.length,
            // );
          ),
        ],
      ),
    );
  }
}
