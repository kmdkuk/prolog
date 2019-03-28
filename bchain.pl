% bchain(Goal)
%
% Succeeds if Goal is true.
% Uses rules, & facts supplied by user to do backward chaining.

bchain(G1 and G2):-                  % G1 and G1 are true if
  bchain(G1),                        % G1 can be proved by backward chaining 
  bchain(G2).                        % and G2 can be too. 
  
bchain(Goal) :-                      % Goal is true if its a fact
  userfact(Goal).

bchain(Goal):-                       % Goal is true if
  rule(if Preconditions then Goal),  % there's a rule concluding it
  bchain(Preconditions).             % and its Preconditions can be
                                     % proved by backward chaining

bchain(Goal):-                       % Goal is true if
  user_says_its_true(Goal).          % user says its true.