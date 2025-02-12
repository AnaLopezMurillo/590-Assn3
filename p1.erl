%% Assn 3 : COMP 590 
%% team: ana isabel lopez murillo

%% to run program: run "start()." without quotations after compiling

-module(p1).
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
				N < 0 -> 
					%% compute abs val of num to 7th power
					io:fwrite("~w~n", [math:pow(abs(N), 7)]);
				N =:= 0 ->
					io:fwrite("0~n");
				N rem 7 =:= 0 ->
					%% input is a multiple of 7, print out the 5th root of the int
					io:fwrite("~w~n", [math:pow(N, 1/5)]);
			true -> 
				io:fwrite("~w~n", [fact(N)])
			end;
	true ->
		io:fwrite("not an integer ~n")
	end.

