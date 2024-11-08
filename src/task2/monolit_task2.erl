-module(monolit_task2).

-export([monolithic_implementation/2, find_sum_of_proper_divisors/3]).

find_sum_of_proper_divisors(N, CurrDivider, Acc) when CurrDivider < N ->
    case N rem CurrDivider =:= 0 of
        true ->
            find_sum_of_proper_divisors(N, CurrDivider + 1, Acc + CurrDivider);
        false ->
            find_sum_of_proper_divisors(N, CurrDivider + 1, Acc)
    end;
find_sum_of_proper_divisors(_N, _CurrDivider, Acc) ->
    Acc.

find_div_list(Begin, End, ListAcc) when Begin =< End ->
    find_div_list(Begin, End - 1, [find_sum_of_proper_divisors(End, 1, 0) | ListAcc]);
find_div_list(_Begin, _End, MapAcc) ->
    MapAcc.

search_for_matches(StartedList, [H | T], Acc, N) ->
    case (H > 0) and (H =< length(StartedList)) of
        true ->
            case lists:nth(H, StartedList) of
                N when N =/= H ->
                    search_for_matches(StartedList, T, Acc + N, N + 1);
                _ ->
                    search_for_matches(StartedList, T, Acc, N + 1)
            end;
        false ->
            search_for_matches(StartedList, T, Acc, N + 1)
    end;
search_for_matches(_StartedList, _List, Acc, _N) ->
    Acc.

monolithic_implementation(Begin, End) ->
    List = find_div_list(Begin, End, []),
    search_for_matches(List, List, 0, 1).
