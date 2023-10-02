import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_tech_test/domain/entities/entities.dart';

class BookCard extends StatelessWidget {
  final BookEntity book;
  final Key key1;

  const BookCard({super.key, required this.key1, required this.book});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width / 2) - 32,
      height: ((MediaQuery.of(context).size.width / 2) - 32) * 2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          key: key1,
          onTap: () {
            Modular.to.pushNamed("/details", arguments: book);
          },
          child: Card(
            elevation: 3,
            margin: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    book.imageLinks.thumbnail,
                    height: (((MediaQuery.of(context).size.width / 2) - 32) * 2) -80,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    book.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                book.subtitle != null
                    ? Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          book.subtitle ?? '',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      )
                    : const SizedBox(height: 1),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    'Author(s): ${book.authors.join(', ')}',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
