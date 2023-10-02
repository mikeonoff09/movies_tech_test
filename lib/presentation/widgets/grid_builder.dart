import 'package:flutter/material.dart';
import 'package:movies_tech_test/domain/entities/entities.dart';
import 'package:movies_tech_test/presentation/widgets/book_card.dart';
import 'package:movies_tech_test/presentation/widgets/book_card_squeleton.dart';

class GridBuilder extends StatelessWidget {
  const GridBuilder({
    super.key,
    required this.bookList,
  });

  final List<BookEntity> bookList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.5,
      ),
      itemCount: bookList.isEmpty ? 6 : bookList.length,
      itemBuilder: (context, index) {
        return bookList.isEmpty
            ? const BookCardSkeleton()
            : BookCard(book: bookList[index]);
      },
    );
  }
}
