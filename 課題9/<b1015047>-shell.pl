%% Micro Expert System. 
%% Ian Frank
%% (Based on original by Alison Cawsey)

% File:    <b1015047>-shell.pl
% Author:  Kamada Kouki
% Date:    2017/07/11
% Purpose: homework Lecture 9
%   "I declare that this represents my own work, with no unacknowledged
%    use of external information."

%% This is a very simple backward chaining rule-based expert system. 
%% Given a possible goal, it backward chains to find out if it is true.
%% If it cannot prove a fact using rules, it will just ask the user.
%% 
%% If it proves the goal, it prints a conclusion.
%%
%% Facts input by the  user are added to the program using assert/1. 
%% The userfact predicate must be dynamic for this to work in SICStus:

:- dynamic(userfact/1).

% -------------------------------------------------------------------
% NEW OPERATORS

:- op(975, fx, if).
:- op(950, xfy, then).
:- op(925, xfy, and).

% -------------------------------------------------------------------
% EXPERT SYSTEM RULES (EXPERT KNOWLEDGE BASE)

rule(if money(X) and eval(X) and enthusiastic(X) then  go_to_graduate_school(X)).
rule(if persuade(X) then money(X)).
rule(if submit_assignment(X) then eval(X)).
rule(if go_to_class(X) then submit_assignment(X)).
rule(if find_research_subjects(X) then enthusiastic(X)).
rule(if enthusiastic(X) then self_study(X)).
rule(if self_study(X) then eval(X)).
rule(if dont_work(X) then enthusiastic(X)).
rule(if eval(X) then persuade(X)).
rule(if have_interesting(X) then find_research_subjects(X)).


% -------------------------------------------------------------------
% TEXT TEMPLATES FOR ENGLISH
%
% qtext/2: 
%
% Simple template for English questions
%
% NOTE: If you don't define qtext for a predicate, it won't be
%       asked to the user.

qtext(money(X), ['Does ', X, ' have enough money?']).
qtext(eval(X), ['Does ', X, ' have many A evaluation?']).
qtext(enthusiastic(X), ['Does ', X, ' have have enthusiastic to go to graduate school?']).
qtext(persuade(X), ['Does ', X, ' persuade parents?']).
qtext(submit_assignment(X), ['Does ', X, ' submit assignment of class?']).
qtext(go_to_class(X), ['Does ', X, ' go to class?']).
qtext(find_research_subjects(X), ['Does ', X, ' find research subject']).
qtext(self_study(X), ['Does ', X, ' study self?']).
qtext(dont_work(X), ['Does not ', X, ' want to work?']).
qtext(have_interesting(X), ['Does ', X, ' have interesting things?']).


% atext/2: Template based translation into recommendations.  

atext(go_to_graduate_school(X), ['I suggest that ', X, ' would go to graduate school.']).

% ------------------------------------------------------------------
%
% MAIN EXPERT SYSTEM SHELL CODE
%
% prove(Goal)
% Succeeds if the goal is proved true.
%
% Picks a goal, and uses bchain to find out if it is true.
% If it is true, check_goal writes out a result. 
% If false, the base case prints out a failure message.
%

prove(Goal) :-
  bchain(Goal),!,                  % bchain to check if true.
  atext(Goal, Text),               % get hold of appropriate text.
  write_list(Text).                % write out the recommendation

prove(_) :- 
  write_list(['The goal does not seem to be true.']).

% bchain(Goal)
%
% Succeeds if Goal is true.
% Uses rules, & facts supplied by user to do backward chaining.
% !を消すことによって，Does X have feathers?の質問にyesと答えたときに質問が続くようになった．

bchain(G1 and G2):-                  % G1 and G1 are true if
  bchain(G1),                        % G1 can be proved by backward chaining 
  bchain(G2), !.                     % and G2 can be too. 
  
bchain(Goal) :-                      % Goal is true if its a fact
  userfact(Goal), !.

bchain(Goal):-                       % Goal is true if
  rule(if Preconditions then Goal),  % there's a rule concluding it
  bchain(Preconditions), !.          % and its Preconditions can be
                                     % proved by backward chaining

bchain(Goal):-                       % Goal is true if
  user_says_its_true(Goal).          % user says its true.


% user_says_its_true(Goal)
%
% True if there is some text to use to ask the user about it,
% and when you ask the user they say yes.
% Asserts the fact so that further rules can use it.

user_says_its_true(Goal) :-
  qtext(Goal, Text),
  yesno(Text),
  assert(userfact(Goal)). 


% yesno(Text)
%
% First, prints out the Text.
% Then asks user to input a character (y/n)
% Succeeds if the user inputs 'y'.

yesno(Text) :-
  write_list(Text),
  write_list(['(y/n)']),
  read(y).

% write_list(List)
% 
% writes out each element of a list
%

write_list([]) :-
  nl.

write_list([H|T]) :-
  write(H),
  write_list(T).

%clear_facts
clear_facts :-
  retract(userfact(X)),
  clear_facts.
clear_facts :-
  write_list(['OK, removed user facts']).
