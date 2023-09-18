import 'package:flutter/material.dart';
import 'package:unjukketrampilan/config/colors.dart';
import 'package:unjukketrampilan/modules/discover/bloc/bloc_discover.dart';
import 'package:unjukketrampilan/modules/discover/model/model_discover.dart';

class MusicPlayed extends StatelessWidget {
  const MusicPlayed({
    super.key,
    required this.blocDiscover,
  });

  final DiscoverBloc blocDiscover;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MusicModel>>(
        stream: blocDiscover.listMusic.stream,
        initialData: blocDiscover.listMusic.value,
        builder: (context, snapshot) {
          final listData = snapshot.data;
          if (listData == null || listData.isEmpty) {
            return const SizedBox();
          }
          return Container(
            color: CustomColors.dark,
            // height: 54,
            child: ListTile(
                title: Text(
                  listData.first.title,
                  style: const TextStyle(color: CustomColors.white),
                ),
                leading: Image.network('https://picsum.photos/500/500?random='),
                subtitle: Row(
                  children: [
                    Text(
                      listData.first.bandName,
                      style: const TextStyle(color: CustomColors.grey),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 4,
                      width: 4,
                      decoration: const BoxDecoration(
                          color: CustomColors.grey, shape: BoxShape.circle),
                    ),
                    Text(
                      listData.first.duration,
                      style: const TextStyle(color: CustomColors.grey),
                    ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.bar_chart_rounded,
                      size: 54,
                      color: CustomColors.white,
                    ),
                    SizedBox(width: 8),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(colors: [
                            CustomColors.purple,
                            CustomColors.red,
                          ])),
                      child: Icon(
                        Icons.pause,
                        color: CustomColors.white,
                      ),
                    )
                  ],
                )),
          );
        });
  }
}
