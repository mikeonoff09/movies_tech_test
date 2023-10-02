import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_tech_test/children/book_details/book_details_module.dart';
import 'package:movies_tech_test/core/app_dio.dart';
import 'package:movies_tech_test/infrastructure/repositories_impl/book_repository_impl.dart';
import 'package:movies_tech_test/presentation/bloc/home_bloc.dart';
import 'package:movies_tech_test/presentation/screens/home_screen.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add(AppDio.new);
    i.add(BookRepositoryImpl.new);
    i.addSingleton<HomeBloc>(
      () => HomeBloc(booksRepository: i.get<BookRepositoryImpl>()),
      config: BindConfig(
        onDispose: (bloc) => bloc.close(),
      ),
    );
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomeScreen());
    r.module('/details', module: DetailsModule());
  }
}
