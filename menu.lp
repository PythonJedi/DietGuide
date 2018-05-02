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
    seed_menu_std(StartMenu),
    fill_menu(StartMenu, Menu).

menu(Menu) :- vegetarian,
    seed_menu_veg(StartMenu),
    fill_menu(StartMenu,Menu).

seed_menu_std([g(0,brisket)|[g(0,chickenThigh)|Menu]]) :-
    %meat(Meat), acceptable(Meat),
    seed_menu_veg(Menu).

seed_menu_veg([g(0,broccoli),
               g(0,carrot),
               g(0,potato),
               g(0,rice),
               g(0,apple),
               g(0,blueberry),
               g(0,grapes),
               g(0,milk),
               g(0,eggs),
               g(0,oil),
               g(0,butter)]).
/*
               :-
    vegetable(Vegetable), acceptable(Vegetable),
    grain(Grain), acceptable(Grain),
    fruit(Fruit), acceptable(Fruit),
    dairy(Dairy), acceptable(Dairy),
    seasoning(Seasoning), acceptable(Seasoning).
*/
fill_menu(Menu, FinalMenu) :-
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

    fill_menu(Menu, r(MinCalories,MaxCalories), r(MinProtein,MaxProtein), r(MinCarbs,MaxCarbs), r(MinFat,MaxFat), FinalMenu).

fill_menu(Menu, Cal, Protein, Carbs, Fat, Menu) :-
    above_lower_bound(Menu, Cal, Protein, Carbs, Fat),
    under_upper_bound(Menu, Cal, Protein, Carbs, Fat).

fill_menu(Menu, Cal, Protein, Carbs, Fat, FinalMenu) :-
    under_upper_bound(Menu, Cal, Protein, Carbs, Fat),
    not above_lower_bound(Menu, Cal, Protein, Carbs, Fat),
    increase_portion(Menu, Cal, Protein, Carbs, Fat, NewMenu),
    fill_menu(NewMenu, Cal, Protein, Carbs, Fat, FinalMenu).

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

increase_portion(Menu,
                 r(MinCal, MaxCal),
                 r(MinPro, MaxPro),
                 r(MinCarb, MaxCarb),
                 r(MinFat, MaxFat),
                 NewMenu) :-
    calc_nutrients(Menu, MCal, MPro, MCarb, MFat),
    CalFrac is (MCal*1.0)/MaxCal,
    ProFrac is (MPro*1.0)/MaxPro,
    CarbFrac is (MCarb*1.0)/MaxCarb,
    FatFrac is (MFat*1.0)/MaxFat,
    write([calories(CalFrac),protein(ProFrac),carbohydrates(CarbFrac),fat(FatFrac)]),write('.\n'),
    increase_portion_f(Menu,
                       CalFrac, ProFrac, CarbFrac, FatFrac,
                       MaxCal, MaxPro, MaxCarb, MaxFat,
                       NewMenu).

increase_portion_f(Menu,
                  CalFrac, ProFrac, CarbFrac, FatFrac,
                  MaxCal, MaxPro, MaxCarb, MaxFat,
                  NewMenu) :-
    CalFrac =< ProFrac,
    CalFrac =< CarbFrac,
    CalFrac =< CarbFrac,
    increase_cal(Menu, MaxCal, NewMenu).
increase_portion_f(Menu,
                   CalFrac, ProFrac, CarbFrac, FatFrac,
                   MaxCal, MaxPro, MaxCarb, MaxFat,
                   NewMenu) :-
    ProFrac =< CalFrac,
    ProFrac =< CarbFrac,
    ProFrac =< CarbFrac,
    increase_pro(Menu, MaxPro, NewMenu).
increase_portion_f(Menu,
                   CalFrac, ProFrac, CarbFrac, FatFrac,
                   MaxCal, MaxPro, MaxCarb, MaxFat,
                   NewMenu) :-
    CarbFrac =< CalFrac,
    CarbFrac =< ProFrac,
    CarbFrac =< FatFrac,
    increase_carb(Menu, MaxCarb, NewMenu).
increase_portion_f(Menu,
                   CalFrac, ProFrac, CarbFrac, FatFrac,
                   MaxCal, MaxPro, MaxCarb, MaxFat,
                   NewMenu) :-
    FatFrac =< CalFrac,
    FatFrac =< ProFrac,
    FatFrac =< CarbFrac,
    increase_fat(Menu, MaxFat, NewMenu).

/*
 *  The way we increase a nutrient is by calculating the most efficient item at
 *  increasing that nutrient, and then taking a half-step toward the goal. We
 *  calculate the most efficient item by maximizing the ratio of desired
 *  movement to 'orthagonal' movement by euclidean metric. Our search algorithm
 *  then builds up a new list with a hole for the mass for the best item so
 *  the step can be applied without re-traversing the list.
 */

choose_best(TopIndex, SubIndex, g(TopGrams, TopItem), g(SubGrams, SubItem), SubNewGrams, SubNewMenu, BestEntry, NewGrams, NewMenu) :-
    TopIndex > SubIndex,
    write(idx(TopItem,TopIndex)),write(' > '),write(idx(SubItem,SubIndex)),write('.\n'),
    SubNewGrams = SubGrams,
    BestEntry = g(TopGrams, TopItem),
    NewMenu = [g(NewGrams,TopItem)|SubNewMenu].
choose_best(TopIndex, SubIndex, g(TopGrams, TopItem), g(SubGrams, SubItem), SubNewGrams, SubNewMenu, BestEntry, NewGrams, NewMenu) :-
    SubIndex >= TopIndex,
    write(idx(SubItem,SubIndex)),write(' >= '),write(idx(TopItem,TopIndex)),write('.\n'),
    NewGrams = SubNewGrams,
    BestEntry = g(SubGrams, SubItem),
    NewMenu = [g(TopGrams,TopItem)|SubNewMenu],
    write('completed choose best\n').

increase_cal(Menu, MaxCal, NewMenu) :-
    best_cal(Menu, g(Grams, Item), NewGrams, NewMenu),
    nutrition(Item, CalPer100g, ProPer100g, FatPer100g, CarbPer100g),
    CalStep is (MaxCal-((Grams*CalPer100g)/100.0))/10, % (goal-diff)/2
    NewGrams is Grams+((CalStep*100.0)/CalPer100g). % convert step to g then add

best_cal([g(Grams, Item)], g(Grams, Item), NewGrams, [g(NewGrams, Item)]).
best_cal([g(TopGrams, TopItem)|Menu], BestEntry, NewGrams, NewMenu) :-
    best_cal(Menu, g(SubGrams, SubItem), SubNewGrams, SubNewMenu),

    nutrition(TopItem, TopCalPer100g, TopProPer100g, TopFatPer100g, TopCarbPer100g),
    nutrition(SubItem, SubCalPer100g, SubProPer100g, SubFatPer100g, SubCarbPer100g),
    TopIndex is (TopCalPer100g**2)/(TopProPer100g**2 + TopFatPer100g**2 + TopCarbPer100g**2 + TopCalPer100g**2),
    SubIndex is (SubCalPer100g**2)/(SubProPer100g**2 + SubFatPer100g**2 + SubCarbPer100g**2 + SubCalPer100g**2),
    choose_best(TopIndex, SubIndex, g(TopGrams, TopItem), g(SubGrams, SubItem), SubNewGrams, SubNewMenu, BestEntry, NewGrams, NewMenu).

increase_pro(Menu, MaxPro, NewMenu) :-
    best_pro(Menu, g(Grams, Item), NewGrams, NewMenu),
    nutrition(Item, CalPer100g, ProPer100g, FatPer100g, CarbPer100g),
    Step is (MaxPro-((Grams*ProPer100g)/100.0))/10, % (goal-diff)/2
    NewGrams is Grams+((Step*100.0)/ProPer100g). % convert step to g then add

best_pro([g(Grams, Item)], g(Grams, Item), NewGrams, [g(NewGrams, Item)]).
best_pro([g(TopGrams, TopItem)|Menu], BestEntry, NewGrams, NewMenu) :-
    best_pro(Menu, g(SubGrams, SubItem), SubNewGrams, SubNewMenu),

    nutrition(TopItem, TopCalPer100g, TopProPer100g, TopFatPer100g, TopCarbPer100g),
    nutrition(SubItem, SubCalPer100g, SubProPer100g, SubFatPer100g, SubCarbPer100g),
    TopIndex is (TopProPer100g**2)/(TopCalPer100g**2 + TopFatPer100g**2 + TopCarbPer100g**2 + TopProPer100g**2),
    SubIndex is (SubProPer100g**2)/(SubCalPer100g**2 + SubFatPer100g**2 + SubCarbPer100g**2 + SubProPer100g**2),
    choose_best(TopIndex, SubIndex, g(TopGrams, TopItem), g(SubGrams, SubItem), SubNewGrams, SubNewMenu, BestEntry, NewGrams, NewMenu).

increase_carb(Menu, MaxCarb, NewMenu) :-
    best_carb(Menu, g(Grams, Item), NewGrams, NewMenu),
    write([Menu, g(Grams, Item), NewGrams, NewMenu]),
    nutrition(Item, CalPer100g, ProPer100g, FatPer100g, CarbPer100g),
    write([Item, CalPer100g, ProPer100g, FatPer100g, CarbPer100g]),write('.\n'),
    Step is (MaxCarb-((Grams*CarbPer100g)/100.0))/10, % (goal-diff)/2
    NewGrams is Grams+((Step*100.0)/CarbPer100g). % convert step to g then add

best_carb([g(Grams, Item)], g(Grams, Item), NewGrams, [g(NewGrams, Item)]) :-
    write('called best carb base case on item: '),write(Item),write('.\n').
best_carb([g(TopGrams, TopItem)|Menu], BestEntry, NewGrams, NewMenu) :-
    write('called best carb on top item: '),write(TopItem),write('.\n'),
    best_carb(Menu, g(SubGrams, SubItem), SubNewGrams, SubNewMenu),

    nutrition(TopItem, TopCalPer100g, TopProPer100g, TopFatPer100g, TopCarbPer100g),
    nutrition(SubItem, SubCalPer100g, SubProPer100g, SubFatPer100g, SubCarbPer100g),
    TopIndex is (TopCarbPer100g**2)/(TopProPer100g**2 + TopFatPer100g**2 + TopCalPer100g**2 + TopCarbPer100g**2),
    SubIndex is (SubCarbPer100g**2)/(SubProPer100g**2 + SubFatPer100g**2 + SubCalPer100g**2 + SubCarbPer100g**2),
    choose_best(TopIndex, SubIndex, g(TopGrams, TopItem), g(SubGrams, SubItem), SubNewGrams, SubNewMenu, BestEntry, NewGrams, NewMenu),
    write('exited best carb on top item: '),write(TopItem),write('.\n').

increase_fat(Menu, MaxFat, NewMenu) :-
    best_fat(Menu, g(Grams, Item), NewGrams, NewMenu),
    nutrition(Item, CalPer100g, ProPer100g, FatPer100g, CarbPer100g),
    Step is (MaxFat-((Grams*FatPer100g)/100.0))/10, % (goal-diff)/2
    NewGrams is Grams+((Step*100.0)/FatPer100g). % convert step to g then add

best_fat([g(Grams, Item)], g(Grams, Item), NewGrams, [g(NewGrams, Item)]).
best_fat([g(TopGrams, TopItem)|Menu], BestEntry, NewGrams, NewMenu) :-
    best_fat(Menu, g(SubGrams, SubItem), SubNewGrams, SubNewMenu),

    nutrition(TopItem, TopCalPer100g, TopProPer100g, TopFatPer100g, TopCarbPer100g),
    nutrition(SubItem, SubCalPer100g, SubProPer100g, SubFatPer100g, SubCarbPer100g),
    TopIndex is (TopFatPer100g**2)/(TopProPer100g**2 + TopCalPer100g**2 + TopCarbPer100g**2 + TopFatPer100g**2),
    SubIndex is (SubFatPer100g**2)/(SubProPer100g**2 + SubCalPer100g**2 + SubCarbPer100g**2 + SubFatPer100g**2),
    choose_best(TopIndex, SubIndex, g(TopGrams, TopItem), g(SubGrams, SubItem), SubNewGrams, SubNewMenu, BestEntry, NewGrams, NewMenu).
