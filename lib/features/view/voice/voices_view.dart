import 'package:clock_app/features/mixin/voices_operation_mixin.dart';
import 'package:clock_app/product/init/lang/locale_keys.g.dart';
import 'package:clock_app/product/init/theme/theme_colors.dart';
import 'package:clock_app/product/widgets/menu_drawer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class VoicesView extends StatefulWidget {
  const VoicesView({super.key});

  @override
  State<VoicesView> createState() => _VoicesViewState();
}

class _VoicesViewState extends State<VoicesView> with VoicesOperationMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: _appBar(),
      body: GridView.builder(
        itemCount: songs.length,
        padding: context.horizontalPaddingMedium,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          mainAxisExtent: 110,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              playSong(songs[index]);
            },
            child: Container(
              decoration: BoxDecoration(
                color: playingSong == songs[index] ? Colors.green : Colors.grey,
                borderRadius: context.lowBorderRadius,
                image: DecorationImage(
                  image: NetworkImage(songs[index].image),
                  fit: BoxFit.cover,
                ),
              ),
              margin: context.paddingNormal,
              child: Padding(
                padding: context.paddingNormal,
                child: Text(
                  songs[index].title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ThemeColors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(LocaleKeys.sounds.tr()),
    );
  }
}
