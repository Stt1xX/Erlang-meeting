-module(tests).

-include_lib("eunit/include/eunit.hrl").

-define(FILENAME, task8).

first_test() ->
    Number = reader:get_string(?FILENAME),
    ?assertEqual({5832.0, [9, 9, 8, 9]}, module_sol:module_implementation(4, Number)).

second_test() ->
    Number = reader:get_string(?FILENAME),
    ?assertEqual({5832.0, [9, 9, 8, 9]}, mon_sol:monolithic_implementation(4, Number)).

third_test() ->
    Number = reader:get_string(?FILENAME),
    ?assertEqual(
        mon_sol:monolithic_implementation(13, Number), mon_sol:monolithic_implementation(13, Number)
    ).
