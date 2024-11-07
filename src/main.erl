-module(main).

-export([solve_task1/1]).

-define(FILENAME, task8).

solve_task1(N) ->
    Number = reader:get_string(?FILENAME),
    case length(Number) < N of
        true ->
            exit("Size of adjacent digigts is too large");
        false ->
            void
    end,
    io:format("~w~n", [module_sol:module_implementation(N, Number)]),
    io:format("~w~n", [mon_sol:monolithic_implementation(N, Number)]).
