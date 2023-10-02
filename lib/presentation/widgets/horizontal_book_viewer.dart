import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_tech_test/domain/entities/entities.dart';
import 'package:movies_tech_test/presentation/widgets/book_card_squeleton.dart';

class HorizontalBookViewer extends StatefulWidget {
  const HorizontalBookViewer({
    super.key,
    required this.bookList,
  });

  final List<BookEntity> bookList;

  @override
  State<HorizontalBookViewer> createState() => _HorizontalBookViewerState();
}

class _HorizontalBookViewerState extends State<HorizontalBookViewer> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.horizontal,
      itemCount: widget.bookList.isEmpty ? 6 : widget.bookList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Container(
            width: 100,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey[300]!,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: widget.bookList.isEmpty
                  ? const BookCardSkeleton()
                  : InkWell(
                      onTap: () => Modular.to.pushNamed("/details",
                          arguments: widget.bookList[index]),
                      child: Image.network(
                        widget.bookList[index].imageLinks.thumbnail,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
