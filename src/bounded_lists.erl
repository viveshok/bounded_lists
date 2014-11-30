
-module(bounded_lists).

-export([new/1, startindex/1, length/1, append/2, sublist/3]).

% {max size, start index, content}
-type bounded_list() :: {pos_integer(), pos_integer() | 'nan', list()}.

-export_type([bounded_list/0]).

-spec new(pos_integer()) -> bounded_list().
new(MaxLength) ->
    {MaxLength, nan, []}.

-spec startindex(bounded_list()) -> non_neg_integer() | 'nan'.
startindex({_MaxLength, nan, []}) ->
    nan;
startindex({_MaxLength, StartIdx, _List}) ->
    StartIdx.

-spec length(bounded_list()) -> non_neg_integer().
length({_MaxLength, _StartIdx, List}) ->
    erlang:length(List).

-spec append(any(), bounded_list()) -> bounded_list().
append(Item, {MaxLength, nan, []}) ->
    {MaxLength, 1, [Item]};
append(Item, {MaxLength, StartIdx, List}) when erlang:length(List) < MaxLength ->
    {MaxLength, StartIdx, [Item|List]};
append(Item, {MaxLength, StartIdx, List}) ->
    {MaxLength, StartIdx+1, [Item|lists:droplast(List)]}.

-spec sublist(bounded_list(), pos_integer(), pos_integer()) -> list().
sublist({_MaxLength, StartIdx, _List}, Start, Len) when StartIdx-Start>Len ->
    []; % totality of sublist requested has been evicted previously
sublist({_MaxLength, StartIdx, List}, Start, Len) when StartIdx>Start ->
    % part of sublist requested has been evicted previously
    lists:sublist(lists:reverse(List), 1, Len-(StartIdx-Start));
sublist({_MaxLength, StartIdx, List}, Start, Len) ->
    lists:sublist(lists:reverse(List), Start-StartIdx+1, Len).

