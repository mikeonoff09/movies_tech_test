import 'package:flutter/material.dart';
import 'package:movies_tech_test/domain/entities/entities.dart';

class StackBookCard extends StatefulWidget {
  final BookEntity book;

  const StackBookCard({super.key, required this.book});

  @override
  StackBookCardState createState() => StackBookCardState();
}

class StackBookCardState extends State<StackBookCard> {
  bool isCardFlipped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isCardFlipped = !isCardFlipped;
        });
      },
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.all(10),
        child: Stack(
          children: [
            AnimatedOpacity(
              opacity: isCardFlipped ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 500),
              child: Image.network(
                widget.book.imageLinks.thumbnail,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            AnimatedOpacity(
              opacity: isCardFlipped ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.book.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Author(s): ${widget.book.authors.join(', ')}',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned.fill(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.flip,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
