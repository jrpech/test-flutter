import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/models/movie.dart';
import 'package:test_app/providers/errors.dart';
import 'package:test_app/repositories/movies.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(MoviesInitial());

  @override
  Stream<MoviesState> mapEventToState(
    MoviesEvent event,
  ) async* {
    if (event is FetchMovies) {
      yield MoviesLoading();

      MoviesRepository repository = new MoviesRepository();
      try {
        final movies = await repository.getMovies();
        yield MoviesLoaded(movies: movies);
      } catch (error) {
        if (error is ServerError)
          //yield ProfileErrorLoad(message: ex.body);
          yield MoviesErrorLoad();
        else
          yield MoviesErrorLoad();
      }
    }
  }
}
