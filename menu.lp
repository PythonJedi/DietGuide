/*
 *  Calculate all daily menus for a given person's parameters
 */

% our user's info
age(22).
activity(sedentary).
sex(male).

% restrictions here:

unacceptable(X) :- fish(X), X = tofu.

% desired variety:
proteins(2).
vegetables(2).
fruits(1).
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

menu(Menu) :- vegetarian, menu(Menu, vegetarian).
menu(Menu) :- not vegetarian, menu(Menu, standard).

_menu(Menu, Plan) :-
    age(Age), activity(Activity), sex(Sex),
    calorie_intake(Age, Sex, Activity, Calories),
    nutrition(Plan, Calories, OzProtein, OzVegetable, OzGrain, OzFruit, OzOil),
    % we guard against zero division above
    proteins(NumProteins), OzPerProtein is OzProtein/NumProteins,
    vegetables(NumVegetables), OzPerVegetable is OzVegetable/NumVegetables,
    fruits(NumFruits), OzPerFruit is OzFruit/NumFruits,
    grains(NumGrains), OzPerGrain is OzGrain/NumGrains,
    dairies(NumDairies), OzPerDairy is OzDairy/NumDairies,
    oils(NumOils), OzPerOil is OzOil/NumOils,

    _fill_proteins(NumProteins, OzPerProtein, Proteins),
    _fill_vegetables(NumVegetables, OzPerVegetable, Veggies),
    _fill_fruits(NumFruits, OzPerFruit, Fruits),
    _fill_grains(NumGrains, OzPerGrain, Grains),
    _fill_dairies(NumDairies, OzPerDairy, Dairies),
    _fill_oils(NumOils, OzPerOil, Oils),

    _append(Proteins, Veggies, SM1),
    _append(SM1, Fruits, SM2),
    _append(SM2, Grains, SM3),
    _append(SM3, Dairies, SM4),
    _append(SM4, Oils, Menu).

_fill_proteins(0, _, []).
_fill_proteins(Number, OzPer, [oz(OzPer, Item)|Items]) :-
    SubNumber is Number - 1,
    protein(Item),
    _fill_proteins(SubNumber, OzPer, Items).
:- _fill_proteins(Num, _1, _2), Num < 0.

_fill_vegetables(0, _, []).
_fill_vegetables(Number, OzPer, [oz(OzPer, Item)|Items]) :-
    SubNumber is Number - 1,
    vegetable(Item),
    _fill_vegetables(SubNumber, OzPer, Items).
:- _fill_vegetables(Num, _1, _2), Num < 0.

_fill_fruits(0, _, []).
_fill_fruits(Number, OzPer, [oz(OzPer, Item)|Items]) :-
    SubNumber is Number - 1,
    fruit(Item),
    _fill_fruits(SubNumber, OzPer, Items).
:- _fill_fruits(Num, _1, _2), Num < 0.

_fill_grains(0, _, []).
_fill_grains(Number, OzPer, [oz(OzPer, Item)|Items]) :-
    SubNumber is Number - 1,
    grain(Item),
    _fill_grains(SubNumber, OzPer, Items).
:- _fill_grains(Num, _1, _2), Num < 0.

_fill_dairies(0, _, []).
_fill_dairies(Number, OzPer, [oz(OzPer, Item)|Items]) :-
    SubNumber is Number - 1,
    dairy(Item),
    _fill_dairies(SubNumber, OzPer, Items).
:- _fill_dairies(Num, _1, _2), Num < 0.

_fill_oils(0, _, []).
_fill_oils(Number, OzPer, [oz(OzPer, Item)|Items]) :-
    SubNumber is Number - 1,
    oil(Item),
    _fill_oils(SubNumber, OzPer, Items).
:- _fill_oils(Num, _1, _2), Num < 0.
