import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unjukketrampilan/common/appbar.dart';
import 'package:unjukketrampilan/config/colors.dart';
import 'package:unjukketrampilan/modules/discover/bloc/bloc_discover.dart';
import 'package:unjukketrampilan/modules/discover/model/model_discover.dart';
import 'package:unjukketrampilan/modules/discover/widget/widget_music_played.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    final blocDiscover = context.read<DiscoverBloc>();
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: const CustomAppbar(
        appbarText: 'My Vault Playlist',
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
                  return Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: Text(
                              listData[index].title,
                              style: const TextStyle(color: CustomColors.white),
                            ),
                            leading: Image.network(
                                'https://picsum.photos/500/500?random=$index'),
                            subtitle: Row(
                              children: [
                                Text(
                                  listData[index].bandName,
                                  style:
                                      const TextStyle(color: CustomColors.grey),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  height: 4,
                                  width: 4,
                                  decoration: const BoxDecoration(
                                      color: CustomColors.grey,
                                      shape: BoxShape.circle),
                                ),
                                Text(
                                  listData[index].duration,
                                  style:
                                      const TextStyle(color: CustomColors.grey),
                                ),
                              ],
                            ),
                            trailing: const Icon(
                              Icons.more_vert,
                              color: CustomColors.white,
                            ));
                      },
                      itemCount: listData.length,
                    ),
                  );
                }),
            MusicPlayed(blocDiscover: blocDiscover)
          ],
        ),
      ),
    );
    ;
  }
}
