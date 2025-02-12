%% Assn 3 : COMP 590 
%% team: ana isabel lopez murillo

-module(p2).
-export([fact/1]).
-export([start/0]).

fact(0) -> 1 ;
fact(N) -> N * fact(N-1).

start() -> 
	{ok, N} = io:read("Enter a number: "),
	% first check: make sure number entered is an int
	if
	 	is_integer(N) -> 
			if 
                N =:= 0 ->
                    io:fwrite("Exiting!~n"),
                    ok;
				N < 0 -> 
					%% compute abs val of num to 7th power
					io:fwrite("~w~n", [math:pow(abs(N), 7)]),
                    start();
				N rem 7 =:= 0 ->
					%% input is a multiple of 7, print out the 5th root of the int
					io:fwrite("~w~n", [math:pow(N, 1/5)]),
                    start();
			true -> 
				io:fwrite("~w~n", [fact(N)]),
                start()
			end;
	true ->
		io:fwrite("not an integer ~n"),
        start()
	end.
