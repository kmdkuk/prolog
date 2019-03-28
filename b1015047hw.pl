% File:    b1015047-hw2.pl
% Author:  Kamada Kouki
% Date:    2017/05/29
% Purpose: Homework lecture 4

%"I declare that this represents my own work, with no unacknowledged use of external information.

%question1
next_doll(helga,olga).
next_doll(olga,tasha).
next_doll(tasha,katrina).

in(X,Y) :-
	next_doll(X,Y).

in(X,Z) :-
	next_doll(X,Y),
	in(Y,Z).


%question2
peano(0).
peano(s(X)) :-
	peano(X).

unpeano(s(X),X).

greater_base(_,0).

greater_than(X,Y) :-
	greater_base(X,Y).
	
greater_than(X,Y) :-
	unpeano(X,New_x),
	unpeano(Y,New_y),
	greater_than(New_x,New_y).

%question3
:- use_module(library(random)).

print_randoms(X) :-
	random(0,100,M),
	format("~w~n",[M]),
	M < X,
	print_randoms(X).

print_randoms(_).



%question4
direct_train(tokyo, karuizawa).
direct_train(morioka, tokyo).
direct_train(shimonoseki, tokyo).
direct_train(karuizawa, nagano).
direct_train(sapporo, hakodate).
direct_train(aomori, morioka).
direct_train(hakodate, aomori).

travel_between(X,Y) :-
	direct_train(X,Y).

travel_between(X,Z) :-
	direct_train(X,Y),
	travel_between(Y,Z).
