/*
*  detail nurtition of food
*  format is "foodName, calories, protein, fat, carbohydrate" 
*  calories, protein, fat, carbohydrate based on 100gram.
*/

% beef
nurition(groundBeef_85p,250,26,15,0).
nurition(groundBeef_70p,332,14,30,0).
nurition(ribeyeSteak,291,24,22,0).
nurition(brisket,155,21,7,0).

% chicken
nurition(chickenBreast,124,31,3.6,0).
nurition(chickenThigh,177,24,8,0).

% fish
nurition(salmon,206,22,12,0).
nurition(halibut,186,14,14,0).
nurition(trout,141,20,6,0).
nurition(tuna,132,28,1.3,0).
nurition(tilapia,129,26,2.7,0).

% pork
nurition(porkLoin,143,21,5,0).
nurition(bacon,541,37,42,0).
nurition(groundPork_96,185,32,6,0).
nurition(groundPork_72,393,23,33,0).

% vegetable
nurition(mixedVegetables,49,3.3,0.8,47.2).
nurition(broccoli,34,2.8,0.4,7).
nurition(kale,49,4.3,0.9,9).
nurition(carrot,41,0.9,0.2,10).
nurition(brusselSprout,43,3.4,0.3,9).


nurition(spinach,23,2.9,0.4,3.6).
nurition(arugula,25,2.6,0.7,3.7).

% grain
nurition(potato,77,2,0.1,17).
nurition(rice,130,2.7,0.3,28).
nurition(pasta,131,5,1.1,25).
nurition(bread,250,10,1.5,49).
nurition(beans,339,21,0.9,63).
nurition(tofu,76,8,4.8,1.9).

% fruit
nurition(apple,52,0.3,0.2,14).
nurition(grapes,67,0.6,0.4,17).
nurition(strawberry,33,0.7,0.3,8).
nurition(blueberry,57,0.7,0.3,14).
nurition(avocado,160,13,11,1).


% dairy
nurition(milk,42,3.4,1,5).
nurition(almondMilk,17,0.6,1.5,0.6).
nurition(egg,155,13,11,1.1).

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
dairy(almondMilk).
dairy(egg).

seasoning(oil).
seasoning(butter).
