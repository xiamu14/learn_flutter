import 'package:flutter/material.dart';
import 'package:learn_router/model/book.dart';

class BooksListScreen extends StatelessWidget {
  final List<Book> books;
  final ValueChanged<Book> onTapped;
  const BooksListScreen({
    Key? key,
    required this.books,
    required this.onTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (BuildContext ctx, index) => Text(books[index].title),
      ),
    );
  }
}
