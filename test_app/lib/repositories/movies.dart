import 'package:test_app/constants.dart';
import 'package:test_app/models/movie.dart';
import 'package:test_app/providers/api.dart';

class MoviesRepository {
  final ApiProvider provider = new ApiProvider(Constants.backendServer);

  Future<List<Movie>> getMovies() async {
    List<Movie> response = await provider.getMovies();
    return response;
  }
}
