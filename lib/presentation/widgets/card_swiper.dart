import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_tech_test/domain/entities/entities.dart';
import 'package:shimmer/shimmer.dart';

class CardSwiper extends StatelessWidget {
  final List<BookEntity> books;
  const CardSwiper({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Swiper(
        scale: 0.8,
        autoplay: true,
        viewportFraction: 0.4,
        itemCount: books.length,
        itemBuilder: (context, index) => _Slider(
          book: books[index],
        ),
      ),
    );
  }
}

class _Slider extends StatelessWidget {
  final BookEntity book;
  const _Slider({
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(0, 10),
          blurRadius: 10,
        ),
      ],
    );
    const shimmerGradient = LinearGradient(
      colors: [
        Color(0xFFEBEBF4),
        Color(0xFFF4F4F4),
        Color(0xFFEBEBF4),
      ],
      stops: [
        0.1,
        0.3,
        0.4,
      ],
      begin: Alignment(-1.0, -0.3),
      end: Alignment(1.0, 0.3),
      tileMode: TileMode.clamp,
    );
    return InkWell(
      onTap: () => Modular.to.pushNamed("/details", arguments: book),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: DecoratedBox(
          decoration: decoration,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.network(
              book.imageLinks.thumbnail,
              height: (((MediaQuery.of(context).size.width / 2) - 32) * 2) - 80,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress != null) {
                  return const Shimmer(
                    gradient: shimmerGradient,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.black12),
                    ),
                  );
                }
                return child;
              },
            ),
          ),
        ),
      ),
    );
  }
}
