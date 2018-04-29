/*
 *  Calculate all daily menus for a given person's parameters
 */

#include 'nutrition.lp'.
#include 'nutrient_levels.lp'.
#include 'intake_guidelines.lp'.

% our user's info
age(22).
activity(sedentary).
sex(male).

% restrictions here:

acceptable(X) :- not fish(X), X \= tofu.



vegetarian :- not accepts_meat.
accepts_meat :- acceptable(X), meat(X).

menu(Menu) :- not vegetarian,
    seed_menu_std(Menu),
    fill_menu(Menu).

menu(Menu) :- vegetarian,
    seed_menu_veg(Menu),
    fill_menu(Menu).

seed_menu_std([g(100,brisket)|Menu]) :-
    %meat(Meat), acceptable(Meat),
    seed_menu_veg(Menu).

seed_menu_veg([g(100,broccoli),
               g(100,potato),
               g(100,apple),
               g(100,milk),
               g(20,oil)]).
/*
               :-
    vegetable(Vegetable), acceptable(Vegetable),
    grain(Grain), acceptable(Grain),
    fruit(Fruit), acceptable(Fruit),
    dairy(Dairy), acceptable(Dairy),
    seasoning(Seasoning), acceptable(Seasoning).
*/
fill_menu(Menu) :-
    age(Age), sex(Sex), activity(Activity),
    calorie_intake(Age, Sex, Activity, Calories),
    nutrients(standard, Calories, Protein, Carbs, Fat),

    MinCalories is Calories*0.95,
    MaxCalories is Calories*1.05,
    MinProtein is Protein*0.95,
    MaxProtein is Protein*1.05,
    MinCarbs is Carbs*0.95,
    MaxCarbs is Carbs*1.05,
    MinFat is Fat*0.95,
    MaxFat is Fat*1.05,

    fill_menu(Menu, r(MinCalories,MaxCalories), r(MinProtein,MaxProtein), r(MinCarbs,MaxCarbs), r(MinFat,MaxFat)).

fill_menu(Menu, Cal, Protein, Carbs, Fat) :-
    above_lower_bound(Menu, Cal, Protein, Carbs, Fat),
    under_upper_bound(Menu, Cal, Protein, Carbs, Fat).

fill_menu(Menu, Cal, Protein, Carbs, Fat) :-
    under_upper_bound(Menu, Cal, Protein, Carbs, Fat),
    not above_lower_bound(Menu, Cal, Protein, Carbs, Fat),
    increase_portion(Menu, NewMenu),
    fill_menu(NewMenu, Cal, Protein, Carbs, Fat).

above_lower_bound(Menu,
                r(MinCalories,MaxCalories),
                r(MinProtein,MaxProtein),
                r(MinCarbs,MaxCarbs),
                r(MinFat,MaxFat)) :-

    calc_nutients(Menu, MenuCal, MenuProtein, MenuCarbs, MenuFat),
    MinCalories =< MenuCalories,
    MinProtein =< MenuProtein,
    MinCarbs =< MenuCarbs,
    MinFat =< MenuFat.

under_upper_bound(Menu,
                r(MinCalories,MaxCalories),
                r(MinProtein,MaxProtein),
                r(MinCarbs,MaxCarbs),
                r(MinFat,MaxFat)) :-
    calc_nutrients(Menu, MenuCalories, MenuProtein, MenuCarbs, MenuFat),
    MenuCalories =< MaxCalories,
    MenuProtein =< MaxProtein,
    MenuCarbs =< MaxCarbs,
    MenuFat =< MaxFat.

calc_nutrients([], 0, 0, 0, 0).
calc_nutrients([g(Grams,Item)|Menu], Cal, Protein, Carbs, Fat) :-
    nutrition(Item, CalPer100g, ProteinPer100g, FatPer100g, CarbsPer100g),

    ItemCal is (CalPer100g * Grams)/100.0,
    ItemProtein is (ProteinPer100g* Grams)/100.0,
    ItemCarbs is (CarbsPer100g* Grams)/100.0,
    ItemFat is (FatPer100g* Grams)/100.0,

    calc_nutrients(Menu, SubCal, SubProtein, SubCarbs, SubFat),

    Cal is SubCal + ItemCal,
    Protein is SubProtein + ItemProtein,
    Carbs is SubCarbs + ItemCarbs,
    Fat is SubFat + ItemFat.

increase_portion([g(Grams,Item)|Menu], [g(NewGrams,Item)|Menu]) :-
    not seasoning(Item),
    NewGrams is 10 + Grams.

increase_portion([g(Grams,Item)|Menu], [g(Grams,Item)|NewMenu]) :-
    increasePortion(Menu, NewMenu).

new_item(Item, []).
new_item(Item, [g(_,MenuItem)|Menu]) :-
    Item \= MenuItem,
    new_item(Item, Menu).

length([], 0).
length([_|Rest], Len) :-
    length(Rest, SubLen),
    Len is 1+SubLen.

count_vegetable([], 0).
count_vegetable([g(_,Item)|Menu], Count) :-
    not vegetable(Item),
    count_vegetable(Menu, Count).
count_vegetable([g(_,Item)|Menu], Count) :-
    vegetable(Item),
    count_vegetable(Menu, SubCount),
    Count is SubCount+1.

count_fruit([], 0).
count_fruit([g(_,Item)|Menu], Count) :-
    not fruit(Item),
    count_fruit(Menu, Count).
count_fruit([g(_,Item)|Menu], Count) :-
    fruit(Item),
    count_fruit(Menu, SubCount),
    Count is SubCount+1.

count_dairy([], 0).
count_dairy([g(_,Item)|Menu], Count) :-
    not dairy(Item),
    count_dairy(Menu, Count).
count_dairy([g(_,Item)|Menu], Count) :-
    dairy(Item),
    count_dairy(Menu, SubCount),
    Count is SubCount+1.

count_grain([], 0).
count_grain([g(_,Item)|Menu], Count) :-
    not grain(Item),
    count_grain(Menu, Count).
count_grain([g(_,Item)|Menu], Count) :-
    grain(Item),
    count_grain(Menu, SubCount),
    Count is SubCount+1.
