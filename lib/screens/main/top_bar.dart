import 'package:flutter/material.dart';
import 'package:awsome_project/screens/main/timer_panel.dart';
import 'package:awsome_project/screens/settings/settings_bottom_sheet.dart';
import 'package:awsome_project/shared/colors.dart';
import 'package:awsome_project/shared/consts.dart';
import 'package:awsome_project/shared/widgets.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(
          GLOBAL_EDGE_MARGIN_VALUE, DRAWER_BUTTON_MARGIN_TOP, 18, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          NeumorphicIconButton(
            icon: Icon(
              Icons.settings,
              color: CustomColors.icon,
            ),
            onTap: () {
              showModalBottomSheet<void>(
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return SettingsBottomSheet();
                  });
            },
          ),
          TimerPanel()
        ],
      ),
    );
  }
}
