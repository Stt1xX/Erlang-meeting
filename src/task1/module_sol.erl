-module(module_sol).

-export([module_implementation/2]).

slice_number(N, [H | T], [AccH | AccT]) ->
    case {(H =:= 0), (length(AccH) >= N)} of
        {true, true} ->
            slice_number(N, T, [[], lists:reverse(AccH) | AccT]);
        {true, false} ->
            slice_number(N, T, [[] | AccT]);
        _ ->
            slice_number(N, T, [[H] ++ AccH | AccT])
    end;
slice_number(N, [], [H | T]) ->
    case (length(H) < N) of
        true ->
            T;
        false ->
            [H | T]
    end.

find_greatest_product([H | T], N, PrevVal, Max, MaxElems) when length(T) >= N ->
    CurrVal = PrevVal / H * lists:nth(N, T),
    case Max >= CurrVal of
        true ->
            find_greatest_product(T, N, CurrVal, Max, MaxElems);
        false ->
            {FirstN, _Rest} = lists:split(N, T),
            find_greatest_product(T, N, CurrVal, CurrVal, FirstN)
    end;
find_greatest_product(_List, _N, _PrevVal, Max, MaxElems) ->
    {Max, MaxElems}.

prep_list(N, List) ->
    {FirstN, _Rect} = lists:split(N, List),
    Max = lists:foldl(fun(X, Acc) -> X * Acc end, 1, FirstN),
    find_greatest_product(List, N, Max, Max, FirstN).

module_implementation(N, Number) ->
    SeparatedLists = lists:map(fun(List) -> prep_list(N, List) end, slice_number(N, Number, [[]])),
    lists:foldl(
        fun({A, ValA}, {B, ValB}) ->
            case A >= B of
                true -> {A, ValA};
                false -> {B, ValB}
            end
        end,
        hd(SeparatedLists),
        tl(SeparatedLists)
    ).
