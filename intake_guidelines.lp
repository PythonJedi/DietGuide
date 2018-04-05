/*
 *  Caloric intake guidelines for individuals based on age, sex, and activity
 *  level.
 *  Source: https://health.gov/dietaryguidelines/2015/resources/2015-2020_Dietary_Guidelines.pdf Table A2-1
 */

% calorie_intake(Age, Sex, Activity, Calories)
calorie_intake(2, male, sedentary, 1000).
calorie_intake(2, male, moderate, 1000).
calorie_intake(2, male, active, 1000).
calorie_intake(2, female, sedentary, 1000).
calorie_intake(2, female, moderate, 1000).
calorie_intake(2, female, active, 1000).

calorie_intake(3, male, sedentary, 1000).
calorie_intake(3, male, moderate, 1400).
calorie_intake(3, male, active, 1400).
calorie_intake(3, female, sedentary, 1000).
calorie_intake(3, female, moderate, 1200).
calorie_intake(3, female, active, 1400).

calorie_intake(4, male, sedentary, 1200).
calorie_intake(4, male, moderate, 1400).
calorie_intake(4, male, active, 1600).
calorie_intake(4, female, sedentary, 1200).
calorie_intake(4, female, moderate, 1400).
calorie_intake(4, female, active, 1400).

calorie_intake(5, male, sedentary, 1200).
calorie_intake(5, male, moderate, 1400).
calorie_intake(5, male, active, 1600).
calorie_intake(5, female, sedentary, 1200).
calorie_intake(5, female, moderate, 1400).
calorie_intake(5, female, active, 1600).

calorie_intake(6, male, sedentary, 1400).
calorie_intake(6, male, moderate, 1600).
calorie_intake(6, male, active, 1800).
calorie_intake(6, female, sedentary, 1200).
calorie_intake(6, female, moderate, 1400).
calorie_intake(6, female, active, 1600).

calorie_intake(7, male, sedentary, 1400).
calorie_intake(7, male, moderate, 1600).
calorie_intake(7, male, active, 1800).
calorie_intake(7, female, sedentary, 1200).
calorie_intake(7, female, moderate, 1600).
calorie_intake(7, female, active, 1800).

calorie_intake(8, male, sedentary, 1400).
calorie_intake(8, male, moderate, 1600).
calorie_intake(8, male, active, 2000).
calorie_intake(8, female, sedentary, 1400).
calorie_intake(8, female, moderate, 1600).
calorie_intake(8, female, active, 1800).

calorie_intake(9, male, sedentary, 1600).
calorie_intake(9, male, moderate, 1800).
calorie_intake(9, male, active, 2000).
calorie_intake(9, female, sedentary, 1400).
calorie_intake(9, female, moderate, 1600).
calorie_intake(9, female, active, 1800).

calorie_intake(10, male, sedentary, 1600).
calorie_intake(10, male, moderate, 1800).
calorie_intake(10, male, active, 2200).
calorie_intake(10, female, sedentary, 1400).
calorie_intake(10, female, moderate, 1800).
calorie_intake(10, female, active, 2000).

calorie_intake(11, male, sedentary, 1800).
calorie_intake(11, male, moderate, 2000).
calorie_intake(11, male, active, 2200).
calorie_intake(11, female, sedentary, 1600).
calorie_intake(11, female, moderate, 1800).
calorie_intake(11, female, active, 2000).

calorie_intake(12, male, sedentary, 1800).
calorie_intake(12, male, moderate, 2200).
calorie_intake(12, male, active, 2400).
calorie_intake(12, female, sedentary, 1600).
calorie_intake(12, female, moderate, 2000).
calorie_intake(12, female, active, 2200).

calorie_intake(13, male, sedentary, 2000).
calorie_intake(13, male, moderate, 2200).
calorie_intake(13, male, active, 2600).
calorie_intake(13, female, sedentary, 1600).
calorie_intake(13, female, moderate, 2000).
calorie_intake(13, female, active, 2200).

calorie_intake(14, male, sedentary, 2000).
calorie_intake(14, male, moderate, 2400).
calorie_intake(14, male, active, 2800).
calorie_intake(14, female, sedentary, 1800).
calorie_intake(14, female, moderate, 2000).
calorie_intake(14, female, active, 2400).

calorie_intake(15, male, sedentary, 2200).
calorie_intake(15, male, moderate, 2600).
calorie_intake(15, male, active, 3000).
calorie_intake(15, female, sedentary, 1800).
calorie_intake(15, female, moderate, 2000).
calorie_intake(15, female, active, 2400).

calorie_intake(16, male, sedentary, 2400).
calorie_intake(16, male, moderate, 2800).
calorie_intake(16, male, active, 3200).
calorie_intake(16, female, sedentary, 1800).
calorie_intake(16, female, moderate, 2000).
calorie_intake(16, female, active, 2400).

calorie_intake(17, male, sedentary, 2400).
calorie_intake(17, male, moderate, 2800).
calorie_intake(17, male, active, 3200).
calorie_intake(17, female, sedentary, 1800).
calorie_intake(17, female, moderate, 2000).
calorie_intake(17, female, active, 2400).

calorie_intake(18, male, sedentary, 2400).
calorie_intake(18, male, moderate, 2800).
calorie_intake(18, male, active, 3200).
calorie_intake(18, female, sedentary, 1800).
calorie_intake(18, female, moderate, 2000).
calorie_intake(18, female, active, 2400).

calorie_intake(Age, male, sedentary, 2600)   :- 19 =< Age, Age =< 20.
calorie_intake(Age, male, moderate, 2800)    :- 19 =< Age, Age =< 20.
calorie_intake(Age, male, active, 3000)      :- 19 =< Age, Age =< 20.
calorie_intake(Age, female, sedentary, 2000) :- 19 =< Age, Age =< 20.
calorie_intake(Age, female, moderate, 2200)  :- 19 =< Age, Age =< 20.
calorie_intake(Age, female, active, 2400)    :- 19 =< Age, Age =< 20.

calorie_intake(Age, male, sedentary, 2400)   :- 21 =< Age, Age =< 25.
calorie_intake(Age, male, moderate, 2800)    :- 21 =< Age, Age =< 25.
calorie_intake(Age, male, active, 3000)      :- 21 =< Age, Age =< 25.
calorie_intake(Age, female, sedentary, 2000) :- 21 =< Age, Age =< 25.
calorie_intake(Age, female, moderate, 2200)  :- 21 =< Age, Age =< 25.
calorie_intake(Age, female, active, 2400)    :- 21 =< Age, Age =< 25.

calorie_intake(Age, male, sedentary, 2400)   :- 26 =< Age, Age =< 30.
calorie_intake(Age, male, moderate, 2600)    :- 26 =< Age, Age =< 30.
calorie_intake(Age, male, active, 3000)      :- 26 =< Age, Age =< 30.
calorie_intake(Age, female, sedentary, 1800) :- 26 =< Age, Age =< 30.
calorie_intake(Age, female, moderate, 2200)  :- 26 =< Age, Age =< 30.
calorie_intake(Age, female, active, 2400)    :- 26 =< Age, Age =< 30.

calorie_intake(Age, male, sedentary, 2400)   :- 31 =< Age, Age =< 35.
calorie_intake(Age, male, moderate, 2600)    :- 31 =< Age, Age =< 35.
calorie_intake(Age, male, active, 3000)      :- 31 =< Age, Age =< 35.
calorie_intake(Age, female, sedentary, 1800) :- 31 =< Age, Age =< 35.
calorie_intake(Age, female, moderate, 2000)  :- 31 =< Age, Age =< 35.
calorie_intake(Age, female, active, 2200)    :- 31 =< Age, Age =< 35.

calorie_intake(Age, male, sedentary, 2400)   :- 36 =< Age, Age =< 40.
calorie_intake(Age, male, moderate, 2600)    :- 36 =< Age, Age =< 40.
calorie_intake(Age, male, active, 2800)      :- 36 =< Age, Age =< 40.
calorie_intake(Age, female, sedentary, 1800) :- 36 =< Age, Age =< 40.
calorie_intake(Age, female, moderate, 2000)  :- 36 =< Age, Age =< 40.
calorie_intake(Age, female, active, 2200)    :- 36 =< Age, Age =< 40.

calorie_intake(Age, male, sedentary, 2200)   :- 41 =< Age, Age =< 45.
calorie_intake(Age, male, moderate, 2600)    :- 41 =< Age, Age =< 45.
calorie_intake(Age, male, active, 2800)      :- 41 =< Age, Age =< 45.
calorie_intake(Age, female, sedentary, 1800) :- 41 =< Age, Age =< 45.
calorie_intake(Age, female, moderate, 2000)  :- 41 =< Age, Age =< 45.
calorie_intake(Age, female, active, 2200)    :- 41 =< Age, Age =< 45.

calorie_intake(Age, male, sedentary, 2200)   :- 46 =< Age, Age =< 50.
calorie_intake(Age, male, moderate, 2600)    :- 46 =< Age, Age =< 50.
calorie_intake(Age, male, active, 2800)      :- 46 =< Age, Age =< 50.
calorie_intake(Age, female, sedentary, 1800) :- 46 =< Age, Age =< 50.
calorie_intake(Age, female, moderate, 2000)  :- 46 =< Age, Age =< 50.
calorie_intake(Age, female, active, 2200)    :- 46 =< Age, Age =< 50.

calorie_intake(Age, male, sedentary, 2200)   :- 51 =< Age, Age =< 55.
calorie_intake(Age, male, moderate, 2400)    :- 51 =< Age, Age =< 55.
calorie_intake(Age, male, active, 2800)      :- 51 =< Age, Age =< 55.
calorie_intake(Age, female, sedentary, 1600) :- 51 =< Age, Age =< 55.
calorie_intake(Age, female, moderate, 1800)  :- 51 =< Age, Age =< 55.
calorie_intake(Age, female, active, 2200)    :- 51 =< Age, Age =< 55.

calorie_intake(Age, male, sedentary, 2200)   :- 56 =< Age, Age =< 60.
calorie_intake(Age, male, moderate, 2400)    :- 56 =< Age, Age =< 60.
calorie_intake(Age, male, active, 2600)      :- 56 =< Age, Age =< 60.
calorie_intake(Age, female, sedentary, 1600) :- 56 =< Age, Age =< 60.
calorie_intake(Age, female, moderate, 1800)  :- 56 =< Age, Age =< 60.
calorie_intake(Age, female, active, 2200)    :- 56 =< Age, Age =< 60.

calorie_intake(Age, male, sedentary, 2000)   :- 61 =< Age, Age =< 65.
calorie_intake(Age, male, moderate, 2400)    :- 61 =< Age, Age =< 65.
calorie_intake(Age, male, active, 2600)      :- 61 =< Age, Age =< 65.
calorie_intake(Age, female, sedentary, 1600) :- 61 =< Age, Age =< 65.
calorie_intake(Age, female, moderate, 1800)  :- 61 =< Age, Age =< 65.
calorie_intake(Age, female, active, 2000)    :- 61 =< Age, Age =< 65.

calorie_intake(Age, male, sedentary, 2000)   :- 66 =< Age, Age =< 70.
calorie_intake(Age, male, moderate, 2200)    :- 66 =< Age, Age =< 70.
calorie_intake(Age, male, active, 2600)      :- 66 =< Age, Age =< 70.
calorie_intake(Age, female, sedentary, 1600) :- 66 =< Age, Age =< 70.
calorie_intake(Age, female, moderate, 2800)  :- 66 =< Age, Age =< 70.
calorie_intake(Age, female, active, 2000)    :- 66 =< Age, Age =< 70.

calorie_intake(Age, male, sedentary, 2400)   :- 71 =< Age, Age =< 75.
calorie_intake(Age, male, moderate, 2600)    :- 71 =< Age, Age =< 75.
calorie_intake(Age, male, active, 3000)      :- 71 =< Age, Age =< 75.
calorie_intake(Age, female, sedentary, 1800) :- 71 =< Age, Age =< 75.
calorie_intake(Age, female, moderate, 2000)  :- 71 =< Age, Age =< 75.
calorie_intake(Age, female, active, 2200)    :- 71 =< Age, Age =< 75.

calorie_intake(Age, male, sedentary, 2000)   :- 76 =< Age.
calorie_intake(Age, male, moderate, 2200)    :- 76 =< Age.
calorie_intake(Age, male, active, 2400)      :- 76 =< Age.
calorie_intake(Age, female, sedentary, 1600) :- 76 =< Age.
calorie_intake(Age, female, moderate, 1800)  :- 76 =< Age.
calorie_intake(Age, female, active, 2000)    :- 76 =< Age.
