import 'package:focofit/utils/asset_utils.dart';
import 'package:get/get.dart';

class KHomeData{
  String title;
  String iconPath;
  KHomeData({required this.title,required this.iconPath});
}
 RxList<KHomeData> homeDataList= [
  KHomeData(
    title: 'Café da manhã',
    iconPath: AppImages.breakfastImg,
  ),
  KHomeData(
    title: 'Almoço',
    iconPath: AppImages.lunchImg,  ),
  KHomeData(
    title: 'Jantar',
    iconPath: AppImages.toLunchImg,  ),
  KHomeData(
    title: 'Lanches',
    iconPath: AppImages.snackImg,  ),
  KHomeData(
    title: 'Atividades físicas',
    iconPath: AppImages.physicalActivityImg,  ),
  KHomeData(
    title: 'Água',
    iconPath: AppImages.waterBotelImg,  ),
  KHomeData(
    title: 'Peso',
    iconPath: AppImages.weightImg,  ),
].obs;

RxList<KHomeData> registerRecipeList= [
  KHomeData(
    title: 'Pesquisar\nmanualmente',
    iconPath: AppImages.blueSearchImg,
  ),
  KHomeData(
    title: 'Identificar\ncom IA',
    iconPath: AppImages.blueCameraImg,  ),
  KHomeData(
    title: 'Código\nde barras',
    iconPath: AppImages.blueBarcodeImg,  ),
].obs;