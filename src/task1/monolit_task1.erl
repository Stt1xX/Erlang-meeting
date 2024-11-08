-module(monolit_task1).

-export([monolithic_implementation/2]).

find_greatest_product([H | T], N, PrevVal, Max, MaxElems) when length(T) >= N ->
    case H of
        0 ->
            CurrVal = get_curr_val(T, N, 1);
        _ ->
            CurrVal = PrevVal / H * lists:nth(N, T)
    end,
    case Max >= CurrVal of
        true ->
            find_greatest_product(T, N, CurrVal, Max, MaxElems);
        false ->
            {FirstN, _Rest} = lists:split(N, T),
            find_greatest_product(T, N, CurrVal, CurrVal, FirstN)
    end;
find_greatest_product(_List, _N, _PrevVal, Max, MaxElems) ->
    {Max, MaxElems}.

get_curr_val([H | T], N, Acc) when N > 0 ->
    get_curr_val(T, N - 1, Acc * H);
get_curr_val(_List, 0, Acc) ->
    Acc.

monolithic_implementation(N, Number) ->
    Max = get_curr_val(Number, N, 1),
    {FirstN, _Rect} = lists:split(N, Number),
    find_greatest_product(Number, N, Max, Max, FirstN).
