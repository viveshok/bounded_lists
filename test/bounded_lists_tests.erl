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
    L1 = bounded_lists:new(8),
    StartIdx1 = bounded_lists:startindex(L1),
    Len1 = bounded_lists:length(L1),
    L2 = bounded_lists:append(101, L1),
    StartIdx2 = bounded_lists:startindex(L2),
    Len2 = bounded_lists:length(L2),
    L3 = bounded_lists:append(102, L2),
    L4 = bounded_lists:append(103, L3),
    L5 = bounded_lists:append(104, L4),
    L6 = bounded_lists:append(105, L5),
    L7 = bounded_lists:append(106, L6),
    StartIdx3 = bounded_lists:startindex(L7),
    Len3 = bounded_lists:length(L7),
    L8 = bounded_lists:append(107, L7),
    L9 = bounded_lists:append(108, L8),
    Len4 = bounded_lists:length(L9),
    L10 = bounded_lists:append(109, L9),
    StartIdx4 = bounded_lists:startindex(L10),
    Len5 = bounded_lists:length(L10),
    L11 = bounded_lists:append(110, L10),
    StartIdx5 = bounded_lists:startindex(L11),
    L12 = bounded_lists:append(111, L11),
    L13 = bounded_lists:append(112, L12),
    StartIdx6 = bounded_lists:startindex(L13),
    Len6 = bounded_lists:length(L13),
    SubList = bounded_lists:sublist(L13, 5, 2),
    EvictedList = bounded_lists:sublist(L13, 1, 12),
    EvictedList2 = bounded_lists:sublist(L13, 1, 8),
    FinalList = bounded_lists:sublist(L13, 5, 8),
    [
        ?_assertEqual(StartIdx1, nan),
        ?_assertEqual(Len1, 0),
        ?_assertEqual(StartIdx2, 1),
        ?_assertEqual(Len2, 1),
        ?_assertEqual(StartIdx3, 1),
        ?_assertEqual(Len3, 6),
        ?_assertEqual(Len4, 8),
        ?_assertEqual(StartIdx4, 2),
        ?_assertEqual(Len5, 8),
        ?_assertEqual(StartIdx5, 3),
        ?_assertEqual(StartIdx6, 5),
        ?_assertEqual(Len6, 8),
        ?_assertEqual(SubList, [105,106]),
        ?_assertEqual(EvictedList, [105,106,107,108,109,110,111,112]),
        ?_assertEqual(EvictedList2, [105,106,107,108]),
        ?_assertEqual(FinalList, [105,106,107,108,109,110,111,112])
    ].
        
bounded_lists_test_() ->
    {setup, fun start/0, fun stop/1, fun instantiator/1}.

