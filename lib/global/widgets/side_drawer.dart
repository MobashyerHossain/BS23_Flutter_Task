import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:starflare/data/enums/git_repo/sort_order.dart';

import '../../data/enums/git_repo/sort_by.dart';
import '../controllers/shared_preference_controller.dart';
import 'theme_mode_toggle_button.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetX<SharedPrefController>(
        tag: "sharedPrefController",
        builder: (sharedPrefController) {
          return Container(
            width: 270.0,
            decoration: BoxDecoration(
              color:
                  sharedPrefController.getIsDark ? Colors.black : Colors.white,
            ),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("App Theme"),
                    ThemeModeToggleButton(),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Sorted Order"),
                    GetX<SharedPrefController>(
                      tag: 'sharedPrefController',
                      builder: (sharedPref) {
                        return ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxHeight: 30.0,
                          ),
                          child: ToggleButtons(
                            selectedColor: Colors.black,
                            fillColor: Colors.grey,
                            borderWidth: 3,
                            borderRadius: BorderRadius.circular(20),
                            isSelected: List.generate(
                              SortOrder.values.length,
                              (index) =>
                                  sharedPref.getSortOrder ==
                                  SortOrder.values
                                      .map(
                                        (e) => e.toString(),
                                      )
                                      .toList()[index],
                            ),
                            children: const [
                              Row(
                                children: [
                                  Icon(
                                    Icons.sort,
                                    size: 20.0,
                                  ),
                                  Icon(
                                    Icons.arrow_upward_rounded,
                                    size: 20.0,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.sort,
                                    size: 20.0,
                                  ),
                                  Icon(
                                    Icons.arrow_downward_rounded,
                                    size: 20.0,
                                  ),
                                ],
                              ),
                            ],
                            onPressed: (index) => sharedPref.setSortOrder(
                              SortOrder.values
                                  .map(
                                    (e) => e.toString(),
                                  )
                                  .toList()[index],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Column(
                  children: [
                    const Text(
                      "Sorted By",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GetX<SharedPrefController>(
                      tag: 'sharedPrefController',
                      builder: (sharedPref) {
                        return ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxHeight: 40.0,
                          ),
                          child: ToggleButtons(
                            selectedColor: Colors.black,
                            fillColor: Colors.grey,
                            direction: Axis.horizontal,
                            borderWidth: 3,
                            borderRadius: BorderRadius.circular(20),
                            isSelected: List.generate(
                              SortBy.values.length,
                              (index) =>
                                  sharedPref.getSortBy ==
                                  SortBy.values
                                      .map(
                                        (e) => e.toString(),
                                      )
                                      .toList()[index],
                            ),
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 14,
                                    ),
                                    Text(" Count"),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Updated"),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Created"),
                              ),
                              // Icon(
                              //   Icons.cloud_upload_outlined,
                              //   size: 20.0,
                              // ),
                              // Icon(
                              //   Icons.add_box_outlined,
                              //   size: 20.0,
                              // ),
                            ],
                            onPressed: (index) => sharedPref.setSortBy(
                              SortBy.values
                                  .map(
                                    (e) => e.toString(),
                                  )
                                  .toList()[index],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
