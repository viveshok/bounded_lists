
# bounded_lists

## Fixed-capacity lists for Erlang

### API
Please look at test/bounded_lists_tests.erl for example calls and expected results.

### Caveats
* Currently exposes very tiny set of functions, planning to expose more as I need them
* new/1 is O(1), startindex/1 is O(1), length/1 is O(N), append/2 is O(N), sublist/3 is O(N). Might optimize later if need be, especially for append/2.

