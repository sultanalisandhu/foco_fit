import 'package:flutter/cupertino.dart';
import 'package:focofit/models/recipe_model.dart';
import 'package:get/get.dart';

class RecipeController extends GetxController {
  ///text fields controllers
  final TextEditingController searchController = TextEditingController();
  final TextEditingController recipeNameC = TextEditingController();
  final TextEditingController recipeIngredientC = TextEditingController();
  final TextEditingController recipeIngredientQuantityC = TextEditingController();
  final TextEditingController recipeDescriptionC = TextEditingController();



  ///list wheel scroll controllers
  final FixedExtentScrollController quantityController = FixedExtentScrollController();

  ///Custom Lists
  final RxList<String> quantityTypeList= ['colher de sobremesa','colher de chá','colher de sopa','ml','gramas','xícara de chá','xícara de café'].obs;
  RxList<RecipeDetails> ingredients = [
    RecipeDetails('Tomato', '2 pcs', [
      PreparationDetails('Chop the tomatoes into small cubes.'),
      PreparationDetails('Add tomatoes to the pan and cook for 5 minutes.'),
    ]),
    RecipeDetails('Onion', '1 pc', [
      PreparationDetails('Peel and finely chop the onion.'),
      PreparationDetails('Fry the onion in olive oil until golden.'),
    ]),
    RecipeDetails('Garlic', '3 cloves', [
      PreparationDetails('Crush and mince the garlic.'),
      PreparationDetails('Add garlic to the pan and cook for 1 minute.'),
    ]),
    RecipeDetails('Olive Oil', '2 tbsp', [
      PreparationDetails('Heat the olive oil in a pan.'),
    ]),
    RecipeDetails('Salt', '1 tsp', [
      PreparationDetails('Add salt to taste at the end of cooking.'),
    ]),
  ].obs;


  ///Variables
  final RxString selectedQuantityType = ''.obs;
  RxBool focused = false.obs;
  RxBool searching = false.obs;
  RxDouble currentCalories = 0.0.obs;



}


