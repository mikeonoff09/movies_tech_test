import 'package:flutter/material.dart';
import 'package:movies_tech_test/domain/entities/book_entity.dart';
import 'package:movies_tech_test/presentation/widgets/start_reading.dart';

class BookDetailsScreen extends StatelessWidget {
  final BookEntity book;

  const BookDetailsScreen({super.key, required this.book});
  @override
  Widget build(BuildContext context) {
    Color darkGreen = const Color(0xff007084);
    Color greyColor = const Color(0xffBDC3C7);
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Hero(
              tag: "img${book.id}",
              child: Image.network(
                book.imageLinks.thumbnail,
                height:
                    (((MediaQuery.of(context).size.width / 2) - 32) * 2) - 80,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          book.title,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w700,
                            fontSize: 21,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          StarRating(
                            rating: 4,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            "Rating",
                            style: TextStyle(color: darkGreen, fontSize: 14),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    book.description,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      letterSpacing: 0.6,
                      wordSpacing: 0.6,
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          decoration: BoxDecoration(
                              color: darkGreen,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Text(
                            "Read Book",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          decoration: BoxDecoration(
                              border: Border.all(color: greyColor, width: 2),
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            "More info",
                            style: TextStyle(
                                color: greyColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
