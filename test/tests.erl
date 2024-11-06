-module(tests).

-include_lib("eunit/include/eunit.hrl").

first_test() ->
    ?assertEqual(16, mod:pow2(4)).

second_test() ->
    ?assertEqual(25, mod:pow2(5)).

third_test() ->
    ?assertEqual(36, mod:pow2(6)).

fourth_test() ->
    ?assertEqual(49, mod:pow2(7)).
