class MusicModel {
  final String title;
  final String bandName;
  final String duration;
  MusicModel({
    required this.title,
    required this.bandName,
    required this.duration,
  });
}

class PlaylistModel {
  final String name;
  final String playlistCount;
  PlaylistModel({
    required this.name,
    required this.playlistCount,
  });
}
