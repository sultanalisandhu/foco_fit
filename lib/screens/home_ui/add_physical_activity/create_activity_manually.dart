import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/controller/home_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/home_ui/add_physical_activity/activity_edited.dart';
import 'package:focofit/screens/home_ui/add_physical_activity/generating_activity.dart';
import 'package:focofit/screens/home_ui/create_diet_screens/generating_diet.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';

class CreateActivityManually extends StatelessWidget {
  CreateActivityManually({super.key});
  final HomeController controller = Get.find<HomeController>(tag: 'homeController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(
        onTap: () {
          Get.back();
        },
        title: 'Criar atividade física',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome da atividade',
              style: primaryTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            10.height,
            CustomTextField(
              context: context,
              hintText: 'Exemplo: caminhada',
              textInputType: TextInputType.text,
            ),
            Text(
              'Duracao total',
              style: primaryTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            10.height,
            CustomTextField(
              context: context,
              prefixText: 'Duracao',
              suffixText: ' min.',
              textDirection: TextDirection.ltr,
              textInputType: TextInputType.number,
            ),
            Text(
              'Calorias queimadas',
              style: primaryTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            10.height,
            CustomTextField(
              context: context,
              prefixText: 'Calorias',
              suffixText: ' Kcal.',
              textDirection: TextDirection.ltr,
              textInputType: TextInputType.number,
              textInputAction: TextInputAction.done,
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: kTextButton(
          onPressed: () {
            Get.to(() => const ActivityEdited());
          },
          btnText: 'Confirmar e criaar',
          useGradient: true
        ),
      ),
    );
  }
}


