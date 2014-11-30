-module(bounded_lists_tests).

-include_lib("eunit/include/eunit.hrl").

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% FIXTURES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

start() ->
    io:format(user,"~nInitiating tests...~n",[]),
    ok.
 
stop(_) ->
    ok.
 
instantiator(_) ->
    BoundedList = bounded_lists:new(8),
    StartIdx1 = bounded_lists:startindex(BoundedList),
    BoundedList2 = bounded_lists:append(10001, BoundedList),
    StartIdx2 = bounded_lists:startindex(BoundedList2),
    [
        ?_assertEqual(StartIdx1, nan),
        ?_assertEqual(StartIdx1, 1)
    ].
        
bounded_lists_test_() ->
    {setup, fun start/0, fun stop/1, fun instantiator/1}.

