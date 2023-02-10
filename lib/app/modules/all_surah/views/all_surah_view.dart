import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/all_surah_controller.dart';

class AllSurahView extends GetView<AllSurahController> {
  const AllSurahView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // body: GetX<AllSurahController>(
        //   init: AllSurahController(),
        //   builder: (_) => const Center(
        //     child: Text(
        //       'AllSurahView is working',
        //       style: TextStyle(fontSize: 20),
        //     ),
        //   ),
        // ),
        );
  }
}
