import 'package:flutter/material.dart';
import 'package:movies_tech_test/domain/entities/book_entity.dart';
import 'package:movies_tech_test/presentation/widgets/widgets.dart';

class SearchScreen extends StatefulWidget {
  final List<BookEntity> bookList;

  const SearchScreen({Key? key, required this.bookList}) : super(key: key);

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  List<BookEntity> filteredBooks = [];

  @override
  void initState() {
    super.initState();
    // Initialize the filteredBooks list with all books initially
    filteredBooks = widget.bookList;
  }

  void _filterBooks(String query) {
    setState(() {
      // Filter the books based on the search query
      filteredBooks = widget.bookList.where((book) {
        final title = book.title.toLowerCase();
        final authors =
            book.authors.map((author) => author.toLowerCase()).join(' ');
        return title.contains(query.toLowerCase()) ||
            authors.contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Books'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _filterBooks,
              decoration: const InputDecoration(
                labelText: 'Search',
                hintText: 'Search for books',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: filteredBooks.isNotEmpty
                ? GridBuilder(bookList: filteredBooks)
                : const Center(child: Text("No results")),
          ),
        ],
      ),
    );
  }
}
