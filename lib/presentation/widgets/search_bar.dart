import 'package:flutter/material.dart';
import 'package:movies_application/presentation/widgets/search_typing.dart';

class SearchBarTab extends StatelessWidget {
  const SearchBarTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBar(
              backgroundColor: const WidgetStatePropertyAll(
                  Color.fromARGB(255, 117, 114, 114)),
              leading: const Icon(Icons.search),
              hintText: 'Search',
              onTap: () {
                showSearch(context: context, delegate: SearchTyping());
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 100),
            child: Image.asset('assets/images/searchic.png'),
          )
        ],
      ),
    );
  }
}
