import 'package:flutter/material.dart';
import 'package:tager_paraffin/features/maps/presentation/widgets/cutom_map_view.dart';
import 'package:tager_paraffin/features/maps/presentation/widgets/get_direction_button.dart';

class MapsScreen extends StatelessWidget {
  const MapsScreen({super.key});
  static const String routeName = "/MapScreen";

  // San Francisco
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      bottomSheet: GetDirectionButton(),
      body: CustomMapView(),
    );
  }
}
