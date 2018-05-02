/*
*  detail nutrition values of food
*  format is "foodName, calories, protein, fat, carbohydrate"
*  calories, protein, fat, carbohydrate based on 1 oz.
*  All data from google
*  calories, Protein/ oz-eq, Dairy/ c-eq, Oil/ g, Vegetables/ c-eq, Fruits/ c-eq, Grains/ oz-eq
*
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

% vegetable c-eq
nutrition(broccoli,31,2.6,6,0.3).
nutrition(kale,66,5.8,12,1.2).
nutrition(carrot,50,1.1,12,0.3).
nutrition(brusselSprout,38,3,8,0.3).
nutrition(lettuce,10,1,2,0.2).
nutrition(spinach,14,1.8,2.2,0.2).
nutrition(arugula,12,1.2,1.6,0.4).

% grain oz-eq
nutrition(potato,27,0.42,3.61,1.26).
nutrition(rice,37,0.67,8.14,0.05).
nutrition(pasta,28,1,5,0.12).
nutrition(bread,79,2.7,15,1).
nutrition(beans,80,5,15,0.3).
nutrition(tofu,23,2.5,0.6,1.5).

% fruit c-eq
nutrition(apple,57,0.3,15,0.2).
nutrition(grapes,62,0.6,16,0.3).
nutrition(strawberry,47,1,11,0.4).
nutrition(banana,133,1.6,34,0.5).
nutrition(avocado,234,2.9,12,21).
nutrition(mango,99,1.4,25,0.6).


% dairy c-eq
nutrition(milk,244,8,12,8).
nutrition(cheese,455,28,1.4,37).


% oil  g
nutrition(vegetableOil,8.84,0,0,1).
nutrition(butter,7.17,0.09,0,0.81).

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
vegetable(carrot).
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
