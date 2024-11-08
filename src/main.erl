-module(main).

-export([solve_task1/1, solve/1]).

-define(FILENAME, task8).

solve_task1(N) ->
    Number = reader:get_string(?FILENAME),
    case length(Number) < N of
        true ->
            exit("Size of adjacent digigts is too large");
        false ->
            void
    end,
    io:format("~w~n", [module_task1:module_implementation(N, Number)]),
    io:format("~w~n", [monolit_task1:monolithic_implementation(N, Number)]).

solve(N) ->
    io:format("~w~n", [monolit_task2:monolithic_implementation(1, N)]),
    io:format("~w~n", [module_task2:module_implementation(1, N)]).
