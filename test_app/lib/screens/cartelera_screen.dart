import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/blocs/authentication/authentication_bloc.dart';
import 'package:test_app/blocs/movies/movies_bloc.dart';
import 'package:test_app/widgets/movie_item.dart';

class CarteleraScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CARTELERA"),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            color: Colors.white,
            onPressed: () async {
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
            },
          )
        ],
      ),
      body: BlocProvider(
        create: (context) {
          return MoviesBloc()..add(FetchMovies());
        },
        child: BlocBuilder<MoviesBloc, MoviesState>(builder: (context, state) {
          if (state is MoviesLoaded) {
            return ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: state.movies.length,
                itemBuilder: (context, index) {
                  return MovieItem(state.movies[index]);
                });
          }

          if (state is MoviesLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Text("");
        }),
      ),
    );
  }
}
