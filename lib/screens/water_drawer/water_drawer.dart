import 'package:flutter/material.dart';
import 'package:awsome_project/screens/water_drawer/water_slider.dart';
import 'package:awsome_project/shared/colors.dart';
import 'package:awsome_project/shared/consts.dart';
import 'package:awsome_project/shared/widgets.dart';
import 'package:awsome_project/view_models/main_view_model.dart';
import 'package:provider/provider.dart';

class WaterDrawer extends StatelessWidget {
  const WaterDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainViewModel>(
      builder: (context, viewModel, _) {
        return Container(
          color: CustomColors.primaryColor,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: GLOBAL_EDGE_MARGIN_VALUE,
                top: DRAWER_BUTTON_MARGIN_TOP,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  NeumorphicIconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 18,
                      color: CustomColors.icon,
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                  const SizedBox(height: 35),
                  Text(
                    'Choose water Level',
                    style: TextStyle(
                      fontSize: 26,
                      color: CustomColors.primaryTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    'Please Select Water Level (in Ltrs)',
                    style: TextStyle(
                      fontSize: 14,
                      color: CustomColors.primaryTextColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Expanded(
                    child: WaterSlider(
                      minValue: 20,
                      maxValue: 100,
                      initValue: viewModel.waterValue,
                      onValueChanged: (newValue) =>
                          viewModel.waterValue = newValue,
                    ),
                  ),
                  const SizedBox(height: 80),
                  RichText(
                    text: TextSpan(
                      text: 'Current Level  ',
                      style: TextStyle(
                        color: CustomColors.primaryTextColor,
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              viewModel.waterValue.toStringAsFixed(0) + " Ltrs",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
