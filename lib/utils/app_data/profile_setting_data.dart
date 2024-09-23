import 'package:focofit/utils/asset_utils.dart';

class ProfileSettingData{
  String? title;
  String? subTitle;
  String? iconPath;
  ProfileSettingData({this.title,this.subTitle,this.iconPath});
}
List<ProfileSettingData> profileSettingAccessList= [
  ProfileSettingData(
    title: 'Email',
    subTitle: 'loremipsum@gmail.com',
    iconPath: AppIcons.emailIcon,
  ),
  ProfileSettingData(
    title: 'Senha',
    subTitle: '**************',
    iconPath: AppIcons.keyBoardIcon,
  ),
  ProfileSettingData(
    title: 'Celular',
    subTitle: '(16) 99999-9999',
    iconPath: AppIcons.phoneIcon,
  ),
];
List<ProfileSettingData> profileSettingDataList= [
  ProfileSettingData(
    title: 'Data de nascimento',
    subTitle: '01/12/1998',
    iconPath: AppIcons.cakeIcon,
  ),
  ProfileSettingData(
    title: 'Gênero',
    subTitle: 'Homem',
    iconPath: AppIcons.genderIcon,
  ),
  ProfileSettingData(
    title: 'Altura',
    subTitle: '60 cm',
    iconPath: AppIcons.heightIcon,
  ),
  ProfileSettingData(
    title: 'Peso atual',
    subTitle: '67 kg',
    iconPath: AppIcons.weightIcon,
  ),
  ProfileSettingData(
    title: 'Peso meta',
    subTitle: '60 kg',
    iconPath: AppIcons.goalWeightIcon,
  ),
  ProfileSettingData(
    title: 'Nível de atividade',
    subTitle: 'Sedentário',
    iconPath: AppIcons.shoeIcon,
  ),
  ProfileSettingData(
    title: 'Minha dieta',
    subTitle: 'Vegetariana',
    iconPath: AppIcons.saladIcon,
  ),
  ProfileSettingData(
    title: 'Meta de calorias',
    subTitle: 'Café da manhã: 33%, Almoço: 33%, Jantar: 33%, Lanches: 33%',
    iconPath: AppIcons.chartIcon,
  ),
  ProfileSettingData(
    title: 'Meta de macronutrientes',
    subTitle: 'Carb: 1000g, Prot: 1000g, Gord: 1000g',
    iconPath: AppIcons.chartIcon,
  ),
  ProfileSettingData(
    title: 'Condições médicas',
    subTitle: 'Hipertensão, diabetes, colesterol alto...',
    iconPath: AppIcons.medicalIcon,
  ),
];
List<ProfileSettingData> profileSettingOnList= [
  ProfileSettingData(
    title: 'Minha assinatura',
    iconPath: AppIcons.badgeIcon,
  ),
  ProfileSettingData(
    title: 'Políticas de privacidade',
    iconPath: AppIcons.shieldIcon,
  ),
  ProfileSettingData(
    title: 'Termos de serviço',
    iconPath: AppIcons.termsIcon,
  ),
  ProfileSettingData(
    title: 'Fonte de recomendações',
    iconPath: AppIcons.bookIcon,
  ),
  ProfileSettingData(
    title: 'Enviar email ao suporte',
    iconPath: AppIcons.envelopeIcon,
  ),
];