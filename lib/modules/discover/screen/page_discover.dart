import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unjukketrampilan/common/appbar.dart';
import 'package:unjukketrampilan/config/colors.dart';
import 'package:unjukketrampilan/modules/discover/bloc/bloc_discover.dart';
import 'package:unjukketrampilan/modules/discover/model/model_discover.dart';
import 'package:unjukketrampilan/modules/discover/widget/widget_music_played.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    final blocDiscover = context.read<DiscoverBloc>();
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: const CustomAppbar(
        appbarText: '',
        action: Icon(
          Icons.settings,
          size: 34,
          color: CustomColors.white,
        ),
        isHome: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              CustomColors.backgroundGradient1,
              CustomColors.backgroundGradient2,
            ])),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'My Playlists',
                      style: TextStyle(
                          color: CustomColors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 12),
                    StreamBuilder<List<PlaylistModel>>(
                        stream: blocDiscover.listPlaylist.stream,
                        initialData: blocDiscover.listPlaylist.value,
                        builder: (context, snapshot) {
                          final listData = snapshot.data;
                          if (listData == null || listData.isEmpty) {
                            return const SizedBox();
                          }
                          return SizedBox(
                            height: 150,
                            child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        GridView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 4,
                                            mainAxisSpacing: 4,
                                          ),
                                          itemCount: 4,
                                          itemBuilder: (context, index2) {
                                            return Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: CustomColors.white,
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      'https://picsum.photos/500/500?random=$index$index2,'),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        Text(
                                          listData[index].name,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: CustomColors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          listData[index].playlistCount,
                                          style: const TextStyle(
                                            color: CustomColors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(width: 12);
                                },
                                itemCount: listData.length),
                          );
                        }),
                    const Text(
                      'My Music',
                      style: TextStyle(
                          color: CustomColors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w700),
                    ),
                    StreamBuilder<List<MusicModel>>(
                        stream: blocDiscover.listMusic.stream,
                        initialData: blocDiscover.listMusic.value,
                        builder: (context, snapshot) {
                          final listData = snapshot.data;
                          if (listData == null || listData.isEmpty) {
                            return const Center(
                                child: Text(
                              'Belum ada music terbaru',
                              style: TextStyle(color: CustomColors.white),
                            ));
                          }
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ListTile(
                                  title: Text(
                                    listData[index].title,
                                    style: const TextStyle(
                                        color: CustomColors.white),
                                  ),
                                  leading: Image.network(
                                      'https://picsum.photos/500/500?random=$index'),
                                  subtitle: Row(
                                    children: [
                                      Text(
                                        listData[index].bandName,
                                        style: const TextStyle(
                                            color: CustomColors.grey),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        height: 4,
                                        width: 4,
                                        decoration: const BoxDecoration(
                                            color: CustomColors.grey,
                                            shape: BoxShape.circle),
                                      ),
                                      Text(
                                        listData[index].duration,
                                        style: const TextStyle(
                                            color: CustomColors.grey),
                                      ),
                                    ],
                                  ),
                                  trailing: const Icon(
                                    Icons.more_vert,
                                    color: CustomColors.white,
                                  ));
                            },
                            itemCount: listData.length,
                          );
                        }),
                  ],
                ),
              ),
            ),
            MusicPlayed(blocDiscover: blocDiscover)
          ],
        ),
      ),
    );
  }
}
