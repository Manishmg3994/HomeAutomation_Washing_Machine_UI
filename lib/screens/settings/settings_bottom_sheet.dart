import 'package:awsome_project/view_models/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:awsome_project/shared/colors.dart';
import 'package:awsome_project/shared/widgets/neumorphic_icon_button.dart';
import 'package:awsome_project/view_models/settings_view_model.dart';
import 'package:awsome_project/view_models/theme_view_model.dart';
import 'package:provider/provider.dart';

class SettingsBottomSheet extends StatefulWidget {
  const SettingsBottomSheet({Key? key}) : super(key: key);

  @override
  _SettingsBottomSheetState createState() => _SettingsBottomSheetState();
}

class _SettingsBottomSheetState extends State<SettingsBottomSheet> {
  static bool get isDarkMode => ServiceLocator.get<ThemeViewModel>().darkMode;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: CustomColors.primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ThemeViewModel>(
            builder: (context, viewModel, _) {
              return NeumorphicIconButton(
                icon: Icon(
                  isDarkMode ? Icons.brightness_7_rounded : Icons.dark_mode,
                  color: CustomColors.icon,
                ),
                pressed: viewModel.darkMode,
                onTap: () {
                  // to update bottomSheet, we need to setState
                  setState(() {
                    viewModel.darkMode = !viewModel.darkMode;
                  });
                },
              );
            },
          ),
          SizedBox(width: 50),
          Consumer<SettingsViewModel>(builder: (context, viewModel, _) {
            return NeumorphicIconButton(
              icon: Icon(
                viewModel.devMode ? Icons.blur_off : Icons.blur_on,
                color: CustomColors.icon,
              ),
              onTap: () {
                viewModel.devMode = !viewModel.devMode;
              },
            );
          }),
        ],
      ),
    );
  }
}
