import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_tech_test/children/book_details/presentation/screens/book_details_screen.dart';

class DetailsModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (_) => BookDetailsScreen(book: r.args.data));
  }
}
