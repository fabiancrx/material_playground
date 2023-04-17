// Vendored from https://github.com/rydmike/flex_color_scheme/tree/master/example/lib/example_copy_paste_from_playground
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../shared/const/app.dart';
import '../shared/widgets/app/show_color_scheme_colors.dart';
import '../shared/widgets/app/show_sub_pages.dart';
import '../shared/widgets/app/show_theme_data_colors.dart';
import '../shared/widgets/universal/page_body.dart';
import '../shared/widgets/universal/showcase_material.dart';
import '../shared/widgets/universal/stateful_header_card.dart';
import '../shared/widgets/universal/theme_mode_switch.dart';

void main() {
  runApp(MaterialApp(
    home: MaterialPlayground(onThemeModeChanged: (_) {}),
  ));
}

// -----------------------------------------------------------------------------
// Home Page for the Copy Paste Playground
// This hom page is used to visualize and demonstrate the active theme
// copied from the Themes Playground, by showing all theming colors and
// commonly used widgets in Flutter with their theme applied.
// -----------------------------------------------------------------------------
class MaterialPlayground extends StatefulWidget {
  const MaterialPlayground({
    super.key,
    this.themeMode = ThemeMode.system,
    required this.onThemeModeChanged,
  });

  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  @override
  State<MaterialPlayground> createState() => _MaterialPlaygroundState();
}

class _MaterialPlaygroundState extends State<MaterialPlayground> {
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController(keepScrollOffset: true, initialScrollOffset: 0);
    // Set enabled menu items.
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);
    final double margins = App.responsiveInsets(media.size.width);
    final double topPadding = media.padding.top + kToolbarHeight + margins;
    final double bottomPadding = media.padding.bottom + margins;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: FlexColorScheme.themedSystemNavigationBar(
        context,
        systemNavBarStyle: FlexSystemNavBarStyle.transparent,
      ),
      child: Scaffold(
        appBar: AppBar(title: Text(App.packageName)),
        body: PageBody(
          controller: scrollController,
          constraints: const BoxConstraints(maxWidth: App.maxBodyWidth),
          child: ListView(
            controller: scrollController,
            padding: EdgeInsets.fromLTRB(margins, topPadding, margins, bottomPadding),
            children: <Widget>[
              _MainPanel(
                themeMode: widget.themeMode,
                onThemeModeChanged: widget.onThemeModeChanged,
              ),
              const SizedBox(height: 8),
              const ShowSubPages(),
              const SizedBox(height: 8),
              const _MaterialButtonsShowcase(),
              const SizedBox(height: 8),
              const _ToggleFabSwitchesChipsShowcase(),
              const SizedBox(height: 8),
              const _TextInputFieldShowcase(),
              const SizedBox(height: 8),
              const _ListTileShowcase(),
              const SizedBox(height: 8),
              const _TabBarShowCase(),
              const SizedBox(height: 8),
              const _BottomBarShowCase(),
              const SizedBox(height: 8),
              const _NavigationRailShowCase(),
              const SizedBox(height: 8),
              const _NavigationDrawerShowCase(),
              const SizedBox(height: 8),
              const _DialogShowcase(),
              const SizedBox(height: 8),
              const _MaterialAndBottomSheetShowcase(),
              const SizedBox(height: 8),
              const _CardShowcase(),
              const SizedBox(height: 8),
              const _TextThemeShowcase(),
              const SizedBox(height: 8),
              const _PrimaryTextThemeShowcase(),
            ],
          ),
        ),
      ),
    );
  }
}

class _MainPanel extends StatefulWidget {
  const _MainPanel({
    required this.themeMode,
    required this.onThemeModeChanged,
  });

  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  @override
  State<_MainPanel> createState() => _MainPanelState();
}

class _MainPanelState extends State<_MainPanel> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99), theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F), theme.colorScheme.onBackground);
    return StatefulHeaderCard(
      leading: Icon(Icons.gradient_outlined, color: iconColor),
      title: const Text('Theme'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text('Theme setup copied from Themes Playground'),
          ),
          ListTile(
            title: const Text('Theme mode'),
            subtitle: Text('Theme '
                '${widget.themeMode.toString().dotTail}'),
            trailing: ThemeModeSwitch(
              themeMode: widget.themeMode,
              onChanged: widget.onThemeModeChanged,
            ),
            onTap: () {
              if (isLight) {
                widget.onThemeModeChanged(ThemeMode.dark);
              } else {
                widget.onThemeModeChanged(ThemeMode.light);
              }
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ShowColorSchemeColors(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: ShowThemeDataColors(),
          ),
        ],
      ),
    );
  }
}

class _MaterialButtonsShowcase extends StatelessWidget {
  const _MaterialButtonsShowcase();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99), theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F), theme.colorScheme.onBackground);
    return StatefulHeaderCard(
      leading: Icon(Icons.crop_16_9_outlined, color: iconColor),
      title: const Text('Material Buttons'),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            ElevatedButtonShowcase(),
            SizedBox(height: 8),
            SizedBox(height: 8),
            FilledButtonShowcase(),
            SizedBox(height: 8),
            FilledButtonTonalShowcase(),
            SizedBox(height: 8),
            OutlinedButtonShowcase(),
            SizedBox(height: 8),
            TextButtonShowcase(),
          ],
        ),
      ),
    );
  }
}

class _ToggleFabSwitchesChipsShowcase extends StatelessWidget {
  const _ToggleFabSwitchesChipsShowcase();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99), theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F), theme.colorScheme.onBackground);
    return StatefulHeaderCard(
      leading: Icon(Icons.toggle_on_outlined, color: iconColor),
      title: const Text('Common Widgets'),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            FabShowcase(),
            SizedBox(height: 8),
            ChipShowcase(),
            SizedBox(height: 8),
            ToggleButtonsShowcase(),
            SizedBox(height: 8),
            SegmentedButtonShowcase(),
            SizedBox(height: 8),
            SwitchShowcase(),
            CheckboxShowcase(),
            RadioShowcase(),
            SliderShowcase(),
            RangeSliderShowcase(),
            PopupMenuButtonsShowcase(),
            DropDownMenuShowcase(explainUsage: true),
            MenuBarShowcase(),
            MenuAnchorShowcase(),
            SizedBox(height: 8),
            IconButtonCircleAvatarDropdownShowcase(),
            TooltipShowcase(),
          ],
        ),
      ),
    );
  }
}

class _TextInputFieldShowcase extends StatelessWidget {
  const _TextInputFieldShowcase();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99), theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F), theme.colorScheme.onBackground);
    return StatefulHeaderCard(
      leading: Icon(Icons.pin_outlined, color: iconColor),
      title: const Text('TextField'),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            TextInputField(),
            SizedBox(height: 8),
            DropDownButtonFormField(),
            SizedBox(height: 8),
            DropDownMenuShowcase(),
          ],
        ),
      ),
    );
  }
}

class _ListTileShowcase extends StatelessWidget {
  const _ListTileShowcase();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99), theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F), theme.colorScheme.onBackground);
    return StatefulHeaderCard(
      leading: Icon(Icons.dns_outlined, color: iconColor),
      title: const Text('ListTile'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          ListTileAllShowcase(),
          Divider(),
          ExpansionTileShowcase(),
          Divider(),
          ExpansionPanelListShowcase(),
        ],
      ),
    );
  }
}

class _TabBarShowCase extends StatelessWidget {
  const _TabBarShowCase();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99), theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F), theme.colorScheme.onBackground);
    return StatefulHeaderCard(
      leading: Icon(Icons.tab_outlined, color: iconColor),
      title: const Text('AppBar TabBar BottomAppBar'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          AppBarShowcase(),
          SizedBox(height: 8),
          TabBarForAppBarShowcase(),
          SizedBox(height: 8),
          TabBarForBackgroundShowcase(),
          SizedBox(height: 8),
          BottomAppBarShowcase(),
        ],
      ),
    );
  }
}

class _BottomBarShowCase extends StatelessWidget {
  const _BottomBarShowCase();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99), theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F), theme.colorScheme.onBackground);
    return StatefulHeaderCard(
      leading: Icon(Icons.video_label, color: iconColor),
      title: const Text('NavigationBar'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          SizedBox(height: 8),
          BottomNavigationBarShowcase(),
          SizedBox(height: 8),
          NavigationBarShowcase(),
        ],
      ),
    );
  }
}

class _NavigationRailShowCase extends StatelessWidget {
  const _NavigationRailShowCase();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99), theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F), theme.colorScheme.onBackground);
    return StatefulHeaderCard(
      leading: Icon(Icons.view_sidebar_outlined, color: iconColor),
      title: const Text('NavigationRail'),
      child: const NavigationRailShowcase(),
    );
  }
}

class _NavigationDrawerShowCase extends StatelessWidget {
  const _NavigationDrawerShowCase();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99), theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F), theme.colorScheme.onBackground);
    return StatefulHeaderCard(
      leading: Icon(Icons.featured_video_outlined, color: iconColor),
      title: const Text('NavigationDrawer'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          NavigationDrawerShowcase(),
          DrawerShowcase(),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _DialogShowcase extends StatelessWidget {
  const _DialogShowcase();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99), theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F), theme.colorScheme.onBackground);
    return StatefulHeaderCard(
      leading: Icon(Icons.branding_watermark_outlined, color: iconColor),
      title: const Text('Dialogs'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          SizedBox(height: 8),
          AlertDialogShowcase(),
          SizedBox(height: 8),
          TimePickerDialogShowcase(),
          SizedBox(height: 8),
          DatePickerDialogShowcase(),
        ],
      ),
    );
  }
}

class _MaterialAndBottomSheetShowcase extends StatelessWidget {
  const _MaterialAndBottomSheetShowcase();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99), theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F), theme.colorScheme.onBackground);
    return StatefulHeaderCard(
      leading: Icon(Icons.call_to_action_outlined, color: iconColor),
      title: const Text('Material, Banner, Sheet & Snack'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: BottomSheetShowcase(),
          ),
          MaterialBannerSnackBarShowcase(),
        ],
      ),
    );
  }
}

class _CardShowcase extends StatelessWidget {
  const _CardShowcase();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99), theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F), theme.colorScheme.onBackground);
    return StatefulHeaderCard(
        leading: Icon(Icons.picture_in_picture_alt_outlined, color: iconColor),
        title: const Text('Card'),
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: CardShowcase(),
        ));
  }
}

class _TextThemeShowcase extends StatelessWidget {
  const _TextThemeShowcase();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99), theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F), theme.colorScheme.onBackground);
    return StatefulHeaderCard(
      leading: Icon(Icons.font_download_outlined, color: iconColor),
      title: const Text('TextTheme'),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: TextThemeShowcase(),
      ),
    );
  }
}

class _PrimaryTextThemeShowcase extends StatelessWidget {
  const _PrimaryTextThemeShowcase();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99), theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F), theme.colorScheme.onBackground);
    return StatefulHeaderCard(
      leading: Icon(Icons.font_download, color: iconColor),
      title: const Text('PrimaryTextTheme'),
      child: SizedBox(
        width: double.infinity,
        child: Material(
          color: Theme.of(context).colorScheme.primary,
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: PrimaryTextThemeShowcase(),
          ),
        ),
      ),
    );
  }
}
