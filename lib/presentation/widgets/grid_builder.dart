import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movies_tech_test/domain/entities/entities.dart';
import 'package:movies_tech_test/presentation/widgets/widgets.dart';

class GridBuilder extends StatelessWidget {
  const GridBuilder({
    super.key,
    required this.bookList,
  });

  final List<BookEntity> bookList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.53,
      ),
      itemCount: bookList.isEmpty ? 6 : bookList.length,
      itemBuilder: (context, index) {
        return bookList.isEmpty
            ? const BookCardSkeleton()
            : FadeIn(
                child: BookCard(
                  book: bookList[index],
                  key1: Key("home_book_$index"),
                ),
              );
      },
    );
  }
}
