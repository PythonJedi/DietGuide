/*
*  detail nurtition of food
*  format is "foodName, calories, protein, fat, carbohydrate"
*  calories, protein, fat, carbohydrate based on 100gram.
*/

% beef
nutrition(groundBeef_85p,250,26,15,0).
nutrition(groundBeef_70p,332,14,30,0).
nutrition(ribeyeSteak,291,24,22,0).
nutrition(brisket,155,21,7,0).

% chicken
nutrition(chickenBreast,124,31,3.6,0).
nutrition(chickenThigh,177,24,8,0).

% fish
nutrition(salmon,206,22,12,0).
nutrition(halibut,186,14,14,0).
nutrition(trout,141,20,6,0).
nutrition(tuna,132,28,1.3,0).
nutrition(tilapia,129,26,2.7,0).

% pork
nutrition(porkLoin,143,21,5,0).
nutrition(bacon,541,37,42,0).
nutrition(groundPork_96,185,32,6,0).
nutrition(groundPork_72,393,23,33,0).

% vegetable
nutrition(mixedVegetables,49,3.3,0.8,47.2).
nutrition(broccoli,34,2.8,0.4,7).
nutrition(kale,49,4.3,0.9,9).
nutrition(carrot,41,0.9,0.2,10).
nutrition(brusselSprout,43,3.4,0.3,9).


nutrition(spinach,23,2.9,0.4,3.6).
nutrition(arugula,25,2.6,0.7,3.7).

% grain
nutrition(potato,77,2,0.1,17).
nutrition(rice,130,2.7,0.3,28).
nutrition(pasta,131,5,1.1,25).
nutrition(bread,250,10,1.5,49).
nutrition(beans,339,21,0.9,63).
nutrition(tofu,76,8,4.8,1.9).

% fruit
nutrition(apple,52,0.3,0.2,14).
nutrition(grapes,67,0.6,0.4,17).
nutrition(strawberry,33,0.7,0.3,8).
nutrition(blueberry,57,0.7,0.3,14).
nutrition(avocado,160,13,11,1).


% dairy
nutrition(milk,42,3.4,1,5).
nutrition(cheddar,402,25,33,1.3).
nutrition(egg,155,13,11,1.1).

%
nutrition(oil,884,0,100,0).
nutrition(butter,717,0.9,81,0.1).



%% Cateories

beef(groundBeef_85).
beef(groundBeef_70).
beef(ribeyeSteak).
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

meat(X) :- beef(X).
meat(X) :- chicken(X).
meat(X) :- fish(X).
meat(X) :- pork(X).

vegetable(mixedVegetables).
vegetable(broccoli).
vegetable(kale).
vegetable(carrot).
vegetable(brusselSprout).
vegetable(spinach).
vegetable(arugula).

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
dairy(cheddar).
dairy(egg).

seasoning(oil).
seasoning(butter).
