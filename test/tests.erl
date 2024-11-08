-module(tests).

-include_lib("eunit/include/eunit.hrl").

-define(FILENAME, task8).

first_test() ->
    Number = reader:get_string(?FILENAME),
    ?assertEqual({5832.0, [9, 9, 8, 9]}, module_task1:module_implementation(4, Number)).

second_test() ->
    Number = reader:get_string(?FILENAME),
    ?assertEqual({5832.0, [9, 9, 8, 9]}, monolit_task1:monolithic_implementation(4, Number)).

third_test() ->
    Number = reader:get_string(?FILENAME),
    ?assertEqual(
        module_task1:module_implementation(13, Number),
        monolit_task1:monolithic_implementation(13, Number)
    ).

fourth_test() ->
    ?assertEqual(220, monolit_task2:find_sum_of_proper_divisors(284, 1, 0)),
    ?assertEqual(284, monolit_task2:find_sum_of_proper_divisors(220, 1, 0)).

fifth_test() ->
    ?assertEqual(220, module_task2:find_sum_of_proper_divisors(284)),
    ?assertEqual(284, module_task2:find_sum_of_proper_divisors(220)).

sixth_test() ->
    ?assertEqual(
        module_task2:module_implementation(1, 10000),
        monolit_task2:monolithic_implementation(1, 10000)
    ).
