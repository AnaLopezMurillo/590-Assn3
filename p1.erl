%% Assn 3 : COMP 590 
%% team: ana isabel lopez murillo, caitlyn kim

%% to run program: run start(). after compiling

%% p1 goal:
	% take in a num. if input is not an int: 
		% print "not an integer" DONE
	% else: 
		% if input < 0: compute abs val of num ^ 7th power, print this DONE
		% else:
			% if input is multiple of 7: print out the 5th root of the integer (num mod 7 = 0)
			% else:
				% print out the factorial of the int DONE

%% 				io:fwrite("You have entered a positive number. ~n"), %% print out the factorial of the int.

% lp.erl has loops examples, at least mimicking

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
					io:fwrite("~w~n", [math:pow(-N, 7)]);
				N rem 7 =:= 0 ->
					%% input is a multiple of 7, print out the 5th root of the int
					io:fwrite("~w~n", [math:pow(N, 1/5)]);
			true -> 
				io:fwrite("~w~n", [fact(N)])
			end;
	true ->
		io:fwrite("not an integer ~n")
	end.

