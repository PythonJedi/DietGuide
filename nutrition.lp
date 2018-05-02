/*
*  detail nutrition values of food
*  format is "foodName, calories, protein, fat, carbohydrate" 
*  calories, protein, fat, carbohydrate based on 1 oz.
*  All data from google
*/

% beef
nutrition(groundBeef_80,72,5,0,6).
nutrition(steak, 60, 7, 0, 3).
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

% vegetable
nutrition(broccoli,11,0.9,2.1,0.1).
nutrition(kale,12,1.1,2.2,0.2).
nutrition(carrot,12,0.3,3,0.05).
nutrition(brusselSprout,13,1,2.6,0.1).
nutrition(lettuce,0.6,0.06,0.15,0.01)
nutrition(spinach,7,0.9,1.1,0.1).
nutrition(arugula,7,0.73,1,0.2).

% grain
nutrition(potato,27,0.42,3.61,1.26).
nutrition(rice,37,0.67,8.14,0.05).
nutrition(pasta,28,1,5,0.12).
nutrition(bread,79,2.7,15,1).
nutrition(beans,80,5,15,0.3).
nutrition(tofu,23,2.5,0.6,1.5).

% fruit
nutrition(apple,8,0,2,0). 
nutrition(grapes,8,0.1,2,0).
nutrition(strawberry,5,0.1,1.3,0).
nutrition(Banana,17,10.2,4,0).
nutrition(avocado,30,0.36,1.6,2.6).
nutrition(mango,12,0.2,3,0.1).


% dairy
nutrition(milk,18,1,1.5,1).
nutrition(cheese,113,7,0.4,9).
nutrition(egg,26,2,0.2,1.7).

% 
nutrition(oil,240,0,0,27).
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
vegetable(carrot).
vegetable(brusselSprout).
vegetable(spinach).
vegetable(arugula).
vegetable(lettuce)

grain(potato).
grain(rice).
grain(pasta).
grain(bread).
grain(beans).
grain(tofu).

fruit(apple).
fruit(grapes).
fruit(strawberry).
fruit(blueberry).
fruit(avocado).

dairy(milk).
dairy(cheese).
dairy(egg).

seasoning(oil).
seasoning(butter).

meat(X): beef(X).
meat(X): pork(X).
meat(X): fish(X).


