-module(reader).

-export([get_string/1]).

-define(ASCII_SHIFT, 48).

get_string(Filename) ->
    case file:open(Filename, [read]) of
        {ok, File} ->
            Str = read_curr_str(File, ""),
            file:close(File),
            Str;
        {error, Reason} ->
            {error, Reason}
    end.

read_curr_str(Filename, Acc) ->
    case io:get_line(Filename, "") of
        eof ->
            lists:reverse(Acc);
        Line ->
            read_curr_str(Filename, prepare_string(Line, "") ++ Acc)
    end.

prepare_string([H | T], Acc) ->
    prepare_string(T, [H - ?ASCII_SHIFT] ++ Acc);
prepare_string([], [_H | T]) ->
    T.
