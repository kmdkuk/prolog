% File:    programs.pl
% Author:  Ian Frank
% Date:    April 2017
% Purpose: AI Programming 2, Homework 1 
%          Programs with no comments.
%          Please write the comments in English.

//"I declare that this represents my own work, with no unacknowledged use of external information."

/*
Question 1 
ian and michael_jordan and statue_of_liberty are tall.
*/

tall(ian).
tall(michael_jordan).
tall(statue_of_liberty).


/* 
Question 2 
square(A,B):
A is B^2
A = 1~4
*/

square(1,1).
square(2,4).
square(3,9).
square(4,16).



/*
Question 3
half(A,B):
B = A/2
B = [1,2,4,8]
*/

half(2,1).
half(4,2).
half(8,4).
half(16,8).

/*
Question 4
reply to hello
*/

hello:-
  write('Hello World!'), 
  nl.

/*
Question 5
same hello.

*/

hello2 :-
  format("Hello World!~n",[]).


/*
Question 6
reply with X to hello
*/

hello(X) :-
  format("Hello ~w!~n",[X]).


/*
Question 7
hello(X,Y)
reply with X and Y to hello
*/

hello(X, Y) :-
  format("Hello ~w and ~w!~n",[X,Y]).

/*
Question 8 
square2(X,Y)
Y = X^2
X = any number
*/

square2(Number, Square) :-
  Square is Number * Number.

/*
Question 9
half(X,Y)
Y = X/2
X = any number
*/

half2(N, Half) :-
  Half is N / 2.


/*
Question 10
count down 10 to 1
*/

go :-
  format("10~n9~n8~n7~n6~n5~n4~n3~n2~n1~n",[]).

/*
Question 11
go(N)
count down N to 1
return no
*/

go(N) :-
  N > 0,
  format("~w~n",[N]),
  NewN is N - 1,
  go(NewN).


/*
Question 12
go(N)
count down N to 1
return yes
*/

new_go(N) :-
  N > 0,
  format("~w~n",[N]),
  NewN is N - 1,
  new_go(NewN).

new_go(_).

