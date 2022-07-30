import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallbay/bloc/wallpaper_event.dart';
import 'package:wallbay/bloc/wallpaper_state.dart';
import 'package:wallbay/const.dart';
import 'package:wallbay/model/wallpaper.dart';
import 'package:http/http.dart' as http;

class WallpaperBloc extends Bloc<WallpaperEvent, WallpaperState> {
  WallpaperBloc() : super(InitState()) {
    on<GetAllWallpaper>(
      (event, emit) async {
        emit(WallpaperIsLoading());
        try {
          var response = await http.get(
            Uri.parse(editorChoiceEndPoint + perPageLimit),
            headers: {"Accept": "application/json", "Authorization": apiKey},
          );
          var data = jsonDecode(response.body)["photos"];
          for (var i = 0; i < data.length; i++) {
            _wallpaper.add(Wallpaper.fromMap(data[i]));
          }
          emit(WallpaperIsLoaded(_wallpaper));
        } catch (_) {
          emit(WallpaperIsNotLoaded());
        }
      },
    );
  }

  get initialState => WallpaperIsLoading();
  final List<Wallpaper> _wallpaper = [];
}
