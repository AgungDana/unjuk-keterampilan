import 'package:sstream/sstream.dart';
import 'package:unjukketrampilan/modules/discover/model/model_discover.dart';

class DiscoverBloc {
  final listPlaylist = SStream<List<PlaylistModel>>([
    PlaylistModel(name: 'Morning Vibes', playlistCount: '15 Songs'),
    PlaylistModel(name: 'Chill Out', playlistCount: '20 Songs'),
    PlaylistModel(name: 'Road Trip Jams', playlistCount: '30 Songs'),
    PlaylistModel(name: 'Workout Motivation', playlistCount: '25 Songs'),
    PlaylistModel(name: 'Acoustic Delights', playlistCount: '18 Songs'),
    PlaylistModel(name: 'Throwback Classics', playlistCount: '40 Songs'),
    PlaylistModel(name: 'Indie Indie Indie', playlistCount: '12 Songs'),
    PlaylistModel(name: 'Late Night Grooves', playlistCount: '22 Songs'),
    PlaylistModel(name: 'Party Anthems', playlistCount: '50 Songs'),
    PlaylistModel(name: 'Relax and Unwind', playlistCount: '28 Songs'),
  ]);
  final listMusic = SStream<List<MusicModel>>([
    MusicModel(
      title: 'Yesterday ',
      bandName: 'The Beatles',
      duration: '2:04',
    ),
    MusicModel(
      title: 'Bohemian Rhapsody ',
      bandName: 'Queen',
      duration: '5:55',
    ),
    MusicModel(
      title: 'Hotel California ',
      bandName: 'Eagles',
      duration: '6:30',
    ),
    MusicModel(
      title: 'Shape of You ',
      bandName: 'Ed Sheeran',
      duration: '3:53',
    ),
    MusicModel(
      title: 'Imagine ',
      bandName: 'John Lennon',
      duration: '3:03',
    ),
    MusicModel(
      title: 'Billie Jean ',
      bandName: 'Michael Jackson',
      duration: '4:54',
    ),
    MusicModel(
      title: 'Stairway to Heaven ',
      bandName: 'Led Zeppelin',
      duration: '8:02',
    ),
    MusicModel(
      title: 'Rolling in the Deep ',
      bandName: 'Adele',
      duration: '3:48',
    ),
    MusicModel(
      title: 'Smells Like Teen Spirit ',
      bandName: 'Nirvana',
      duration: '5:01',
    ),
    MusicModel(
      title: 'Don\'t Stop Believin\' ',
      bandName: 'Journey',
      duration: '4:11',
    ),
    MusicModel(
      title: 'Hey Jude ',
      bandName: 'The Beatles',
      duration: '7:11',
    ),
    MusicModel(
      title: 'Wonderwall ',
      bandName: 'Oasis',
      duration: '4:18',
    ),
    MusicModel(
      title: 'Purple Haze ',
      bandName: 'Jimi Hendrix',
      duration: '2:51',
    ),
    MusicModel(
      title: 'Like a Rolling Stone ',
      bandName: 'Bob Dylan',
      duration: '6:13',
    ),
    MusicModel(
      title: 'Uptown Funk',
      bandName: 'Mark Ronson ft. Bruno Mars',
      duration: '4:29',
    ),
    MusicModel(
      title: 'Imagine Dragons ',
      bandName: 'Radioactive',
      duration: '3:06',
    ),
    MusicModel(
      title: 'Sweet Child o\' Mine ',
      bandName: 'Guns N\' Roses',
      duration: '5:56',
    ),
    MusicModel(
      title: 'Viva la Vida ',
      bandName: 'Coldplay',
      duration: '4:03',
    ),
    MusicModel(
      title: 'Thriller ',
      bandName: 'Michael Jackson',
      duration: '5:58',
    ),
    MusicModel(
      title: 'Boogie Wonderland ',
      bandName: 'Earth, Wind & Fire',
      duration: '4:48',
    ),
  ]);
}
