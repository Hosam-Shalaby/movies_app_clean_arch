import 'package:flutter/material.dart';

import 'package:movies_application/presentation/views/tabs/search_tab.dart';


class SearchTyping extends SearchDelegate {
  
  

  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    // var movieSearched = viewModel.initPage(query);
    return SearchTab(movieName: query,);
  
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
