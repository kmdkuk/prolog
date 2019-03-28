% File:    b1015047homework.pl
% Author:  Kamada Kouki
% Date:    2017/06/19
% Purpose: homework Lecture 7
%   "I declare that this represents my own work, with no unacknowledged
%    use of external information."

/*
Question 1
Write a predicate head/2. 
The first argument is a list.
The second argument (the result of the predicate) is the head of the list.
*/
head([Head|Tail],Head).

/*
Question2
Write a predicate tail/2. 
The first argument is a list. 
The second argument (the result of the predicate) is the tail of the list.
*/
tail([Head|Tail],Tail).

/*
Question3
Write a predicate print_every_second/1 that prints every other element in a list, i.e., the 2nd, 4th, 6th, 8th element.
The predicate should succeed if the argument is a list. 
The predicate should fail if the argument is not a list.
*/

print_every_second([]).

print_every_second(List):-
	tail(List,Tail),
	head(Tail,Tail_Head),
	format("~w~n",[Tail_Head]),
	tail(Tail,NextList),
	print_every_second(NextList).

print_every_second(List):-
	tail(List,Tail),
	print_every_second(Tail).

/*
Question4
Write a predicate print_numbers(List) that outputs the numbers in a list.
The predicate should succeed if the argument is a list. 
The predicate should fail if the argument is not a list.
*/

print_numbers([]).
print_numbers(List):-
	head(List,Head),
	number(Head),
	format("~w~n",[Head]),
	tail(List,NextList),
	print_numbers(NextList).
print_numbers(List):-
	tail(List,NextList),
	print_numbers(NextList).