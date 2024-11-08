-module(module_task2).

-export([module_implementation/2, find_sum_of_proper_divisors/1]).

find_sum_of_proper_divisors(N) ->
    lists:foldl(
        fun(X, Acc) ->
            case N rem X == 0 of
                true -> Acc + X;
                false -> Acc
            end
        end,
        0,
        lists:seq(1, N - 1)
    ).

search_for_matches(Map) ->
    maps:fold(
        fun(Key1, Value1, Acc) ->
            case maps:find(Value1, Map) of
                {ok, Value2} ->
                    case (Value2 == Key1) and (Value2 =/= Value1) of
                        true ->
                            Acc + Value1;
                        false ->
                            Acc
                    end;
                error ->
                    Acc
            end
        end,
        0,
        Map
    ).

module_implementation(Begin, End) ->
    search_for_matches(
        maps:from_list(
            lists:map(fun(X) -> {X, find_sum_of_proper_divisors(X)} end, lists:seq(Begin, End))
        )
    ).
