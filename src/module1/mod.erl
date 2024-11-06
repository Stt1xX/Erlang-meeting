-module(mod).

-export([pow2/1, test3/0]).
-elvis([{elvis_style, invalid_dynamic_call, #{ignore => [debug_functions]}}]).

test3() ->
    io:format("hello~n").

pow2(X) ->
    X * X.
