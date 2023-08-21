// ignore_for_file: use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:clock_app/features/mixin/theme_operation_mixin.dart';
import 'package:clock_app/product/init/lang/locale_keys.g.dart';
import 'package:clock_app/product/init/theme/theme_colors.dart';
import 'package:clock_app/product/model/image_model.dart';
import 'package:clock_app/product/utils/shared_preferences_utils.dart';
import 'package:clock_app/product/utils/snackbar.dart';
import 'package:clock_app/product/widgets/menu_drawer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ThemeView extends StatefulWidget {
  const ThemeView({super.key, required this.controller});
  final PageController controller;

  @override
  State<ThemeView> createState() => _ThemeViewState();
}

class _ThemeViewState extends State<ThemeView> with ThemeOperationMixin {
  int _calculateCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.height;

    if (screenWidth < 600) {
      return 3;
    } else {
      return 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(controller: widget.controller),
      appBar: _appBar(),
      body: SafeArea(
        child: FutureBuilder<ImageModel>(
          future: loadImageModel(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _calculateCrossAxisCount(context),
                    mainAxisSpacing: 30,
                    mainAxisExtent: 110,
                  ),
                  padding: context.horizontalPaddingNormal,
                  itemCount: snapshot.data!.images.length,
                  itemBuilder: (context, index) {
                    double screenWidth = MediaQuery.of(context).size.width;
                    bool isTablet = screenWidth > 600;

                    final imageName = snapshot.data!.images[index];
                    final imagePath = isTablet
                        ? 'assets/theme/ipad/$imageName'
                        : 'assets/theme/$imageName';
                    return ThemeWidget(
                      imagePath: imagePath,
                      controller: widget.controller,
                    );
                  },
                );
              } else {
                return Center(
                  child: Text(LocaleKeys.datanotFound.tr()),
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
          },
        ),
      ),
    );
  }

  AppBar _appBar() => AppBar(title: Text(LocaleKeys.themes.tr()));
}

class ThemeWidget extends StatefulWidget {
  const ThemeWidget({
    super.key,
    required this.imagePath,
    required this.controller,
  });
  final String imagePath;
  final PageController controller;

  @override
  State<ThemeWidget> createState() => _ThemeWidgetState();
}

class _ThemeWidgetState extends State<ThemeWidget> {
  bool isSelectedTheme = false;

  @override
  void initState() {
    super.initState();
    isSelectedThemeLoad();
  }

  Future<void> isSelectedThemeLoad() async {
    String? theme = await SharedPreferencesUtil.getTheme();
    isSelectedTheme = theme == widget.imagePath ? true : false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingNormal,
      child: GestureDetector(
        onTap: () async {
          await SharedPreferencesUtil.loadTheme(widget.imagePath);
          final successSnackbar = AppSnackBar.showSnackBar(
            ContentType.success,
            LocaleKeys.succeeds.tr(),
            LocaleKeys.themeApplied.tr(),
            context,
          );

          widget.controller.previousPage(
            duration: context.durationLow,
            curve: Curves.linear,
          );

          ScaffoldMessenger.of(context).showSnackBar(successSnackbar);
        },
        child: Container(
          decoration: BoxDecoration(
            border: isSelectedTheme
                ? Border.all(color: ThemeColors.white, width: 3)
                : null,
          ),
          child: Image.asset(
            widget.imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
