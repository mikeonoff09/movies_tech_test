import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleTheme = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(
                Icons.book_outlined,
                color: colors.primary,
              ),
              const SizedBox(width: 5),
              Text(
                "Books Catalog",
                style: titleTheme,
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Modular.to.pushNamed("/search");
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
