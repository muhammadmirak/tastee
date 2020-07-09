// import 'package:flutter/material.dart';

List<ListWords>  listWords = [
  ListWords('pasta', 'Container'),
  ListWords('chickenbroast', 'Container'),
];

class ListWords {
  String titlelist;
  String definitionlist;

  ListWords(String titlelist, String definitionlist) {
    this.titlelist = titlelist;
    this.definitionlist = definitionlist;
  }
}