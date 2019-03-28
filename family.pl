parent(fred,greta).
parent(greta,henry).
grandparent(X,Z):-
	parent(X,Y),
	parent(Y,Z).