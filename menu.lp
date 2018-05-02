/*
 *  Calculate all daily menus for a given person's parameters
 */

% our user's info
age(30).
activity(moderate).
sex(male).

% restrictions here:

unacceptable(X) :- meat(X).
unacceptable(avocado).
unacceptable(spinach).

% desired variety:
proteins(1).
vegetables(3).
fruits(2).
grains(2).
dairies(1).
oils(1).


/*
 * Actual code starts here. The above code is stubbed user input.
 */

 #include 'nutrition.lp'.
 #include 'nutrient_levels.lp'.
 #include 'intake_guidelines.lp'.
 #include 'lists.lp'.

:- proteins(0).
:- vegetables(0). % eat your veggies!
:- fruits(0).
:- grains(0).
:- dairies(0).
:- oils(0).

vegetarian :- not accepts_meat.
accepts_meat :- not unacceptable(X), meat(X).

menu(Menu) :- vegetarian, _menu(Menu, vegetarian).
menu(Menu) :- not vegetarian, _menu(Menu, standard).

_menu(Menu, Plan) :-
    age(Age), activity(Activity), sex(Sex),
    calorie_intake(Age, Sex, Activity, Calories),
    nutrients(Plan, Calories, OzProtein, OzDairy, OzOil, OzVegetable, OzFruit, OzGrain),
    % we guard against zero division above
    proteins(NumProteins), OzPerProtein is OzProtein/NumProteins,
    vegetables(NumVegetables), OzPerVegetable is OzVegetable/NumVegetables,
    fruits(NumFruits), OzPerFruit is OzFruit/NumFruits,
    grains(NumGrains), OzPerGrain is OzGrain/NumGrains,
    dairies(NumDairies), OzPerDairy is OzDairy/NumDairies,
    oils(NumOils), OzPerOil is OzOil/NumOils,

    _fill_oils(NumOils, OzPerOil, Oils),
    _fill_vegetables(NumVegetables, OzPerVegetable, Veggies),
    _fill_fruits(NumFruits, OzPerFruit, Fruits),
    _fill_grains(NumGrains, OzPerGrain, Grains),
    _fill_dairies(NumDairies, OzPerDairy, Dairies),
    _fill_proteins(NumProteins, OzPerProtein, Proteins),

    _append(Proteins, Veggies, SM1),
    _append(SM1, Fruits, SM2),
    _append(SM2, Grains, SM3),
    _append(SM3, Dairies, SM4),
    _append(SM4, Oils, Menu).

_fill_proteins(0, _, []).
_fill_proteins(Number, OzPer, [oz(OzPer, Item)|Items]) :-
    Number > 0,
    SubNumber is Number - 1,
    _fill_proteins(SubNumber, OzPer, Items),
    protein(Item), not unacceptable(Item),
    not same_kind_protein(Item,Items).

same_kind_protein(Item, [oz(_,Item)|_]) :- protein(Item).
same_kind_protein(Item1, [oz(_,Item2)|_]) :-
    beef(Item1),beef(Item2).
same_kind_protein(Item1, [oz(_,Item2)|_]) :-
    fish(Item1),fish(Item2).
same_kind_protein(Item1, [oz(_,Item2)|_]) :-
    pork(Item1),pork(Item2).
same_kind_protein(Item1, [oz(_,Item2)|_]) :-
    chicken(Item1),chicken(Item2).
same_kind_protein(Item1, [oz(_,_)|Rest]) :- same_kind_protein(Item1, Rest).

_fill_vegetables(0, _, []).
_fill_vegetables(Number, OzPer, [oz(OzPer, Item)|Items]) :-
    Number > 0,
    SubNumber is Number - 1,
    _fill_vegetables(SubNumber, OzPer, Items),
    vegetable(Item), not unacceptable(Item),
    not _member(oz(OzPer,Item), Items).

_fill_fruits(0, _, []).
_fill_fruits(Number, OzPer, [oz(OzPer, Item)|Items]) :-
    Number > 0,
    SubNumber is Number - 1,
    _fill_fruits(SubNumber, OzPer, Items),
    fruit(Item), not unacceptable(Item),
    not _member(oz(OzPer,Item), Items).

_fill_grains(0, _, []).
_fill_grains(Number, OzPer, [oz(OzPer, Item)|Items]) :-
    Number > 0,
    SubNumber is Number - 1,
    _fill_grains(SubNumber, OzPer, Items),
    grain(Item), not unacceptable(Item),
    not _member(oz(OzPer,Item), Items).

_fill_dairies(0, _, []).
_fill_dairies(Number, OzPer, [oz(OzPer, Item)|Items]) :-
    Number > 0,
    SubNumber is Number - 1,
    _fill_dairies(SubNumber, OzPer, Items),
    dairy(Item), not unacceptable(Item),
    not _member(oz(OzPer,Item), Items).

_fill_oils(0, _, []).
_fill_oils(Number, OzPer, [oz(OzPer, Item)|Items]) :-
    Number > 0,
    SubNumber is Number - 1,
    _fill_oils(SubNumber, OzPer, Items),
    oil(Item), not unacceptable(Item),
    not _member(oz(OzPer,Item), Items).

?- menu(Menu).

calc_nutrients([], 0, 0, 0, 0).
calc_nutrients([oz(Oz, Item)|Menu], Cal, Protein, Carbs, Fat) :-
    calc_nutrients(Menu, SubCal, SubProt, SubCarb, SubFat),
    nutrition(Item, ItemCal, ItemProt, ItemCarb, ItemFat),
    Cal is Oz*ItemCal + SubCal,
    write('added in '),write(Oz),write(' Oz of '),write(Item),write(' at '),write(ItemCal),write(' cal/oz to '),write(SubCal),write(' cal so far for a total of '),write(Cal),write(' cal.\n'),
    Protein is Oz*ItemProt + SubProt,
    Fat is Oz*ItemFat + SubFat,
    Carbs is Oz*ItemCarb + SubCarb.
