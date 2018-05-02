/*
 *  detail nutrition values of food
 *  format is "foodName, calories, protein, fat, carbohydrate"
 *  calories, protein, carbohydrate, fat based on 1 oz-eq.
 *  Data from google, https://www.aqua-calc.com/calculate/food-volume-to-weight
 */

% beef
nutrition(groundBeef_80,72,5,0,6).
nutrition(steak, 76.83, 7, 0, 5.38).
nutrition(brisket,44,6,0,2.1).

% chicken
nutrition(chickenBreast,47,9,0,1).
nutrition(chickenThigh,33,6,0,1).

% fish
nutrition(salmon,48,6,0,3).
nutrition(halibut,27,5,0,0).
nutrition(trout,54,8,0,2.3).
nutrition(tuna,52,8,0,1.6).
nutrition(tilapia,25,5,0,1).

% pork
nutrition(porkLoin,68,7.6,0,4).
nutrition(bacon,117,3.5,0.4,11).
nutrition(groundPork_96,52,9,0.2,1.8).
nutrition(groundPork_72,111,6.5,0.4,9).

nutrition(egg,78,6,5,0.6). % an oz-eq of egg is 1 egg

nutrition(tofu,47,5,1.15,3). % an oz-eq of tofu is 1/4 cup

/*
 *  Due to some issues with sourcing data and unit conversions, vegetable,
 *  fruit, grain, and diary are measured in fluid ounces (1/8 cup), not weight
 *  ounces (1/16 lb). Except they're actually measures in fluid ounce
 *  equivalents since 1/2 cup of dried vegetable counts for the same as 2 cups
 *  of leafy green vegetable.
 */

% vegetables
nutrition(broccoli,2,0.26,0.45,0.03).
nutrition(kale,1,0.09,0.18,0.02).
nutrition(brusselSprout,5,0.37,0.98,0.03).
nutrition(lettuce,2,0.19,0.31,0.03). % lettuce floz-eq are 2 floz
nutrition(spinach,11,1.23,1.71,0.22). % spinach floz-eq are 2 floz
nutrition(arugula,1,0.13,0.18,0.03). % arugula floz-eq are 2 floz
nutrition(potato,14,0.3,3.29,0.02).

% grain
nutrition(rice,85,1.74,17.63,0.74).
nutrition(pasta,54,2.12,11.19,0.45).
nutrition(bread,15,0.5,2.78,0.19).
nutrition(beans,82,5.5,14.95,0.26).


% fruit
nutrition(apple,8.125,0.375,2.125,0.025).
nutrition(grapes,7.75,0.1,2,0).
nutrition(strawberry,5,0.1,1.3,0).
nutrition(banana,17,10.2,4,0).
nutrition(avocado,30,0.36,1.6,2.6).
nutrition(mango,12,0.2,3,0.1).


% dairy
nutrition(milk,12.875,1,1.5,0.6125).
nutrition(cheese,113,7,0.4,9).

% oils
nutrition(vegetableOil,240,0,0,27).
nutrition(butter,203,0.2,0,23).

%% Cateories
beef(groundBeef_80).
beef(steak).
beef(brisket).

chicken(chickenBreast).
chicken(chickenThigh).

fish(salmon).
fish(halibut).
fish(trout).
fish(tuna).
fish(tilapia).

pork(porkLoin).
pork(bacon).
pork(groundPork_96).
pork(groundPork_72).

vegetable(broccoli).
vegetable(kale).
%vegetable(carrot).
vegetable(brusselSprout).
vegetable(spinach).
vegetable(arugula).
vegetable(lettuce).
vegetable(potato).

grain(rice).
grain(pasta).
grain(bread).

fruit(apple).
fruit(grapes).
fruit(strawberry).
fruit(blueberry).
fruit(avocado).

dairy(milk).
dairy(cheese).
dairy(egg).

oil(vegetableOil).
oil(butter).

meat(X) :- beef(X).
meat(X) :- pork(X).
meat(X) :- fish(X).

protein(X):- meat(X).
protein(tofu).
protein(beans):- not vegetable(beans).
vegetable(beans):- not protein(beans).
