import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> translations = {};

  Future<void> loadTranslations() async {
    String englishJson = await rootBundle.loadString('assets/languages/en_US.json');
    String portugueseJson  = await rootBundle.loadString('assets/languages/pt_PT.json');

    translations['en_US'] = Map<String, String>.from(json.decode(englishJson));
    translations['pt_PT'] = Map<String, String>.from(json.decode(portugueseJson ));
  }


  @override
  Map<String, Map<String, String>> get keys => translations;
}