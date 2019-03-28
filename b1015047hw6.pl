word(article, a).
word(article, the).
word(noun, lecturer).
word(noun, squid).
word(verb, likes).
word(verb, eats).

sentence(Word1, Word2, Word3, Word4, Word5) :-
  word(article, Word1),
  word(noun, Word2),
  word(verb, Word3),
  word(article, Word4),
  word(noun, Word5).


word(abalone,a,b,a,l,o,n,e).
word(abandon,a,b,a,n,d,o,n).
word(enhance,e,n,h,a,n,c,e).
word(anagram,a,n,a,g,r,a,m).
word(connect,c,o,n,n,e,c,t).
word(elegant,e,l,e,g,a,n,t).

crosswd(H1,H2,H3,V1,V2,V3) :-
	word(H1,_,A,_,B,_,C,_),
	word(H2,_,D,_,E,_,F,_),
	word(H3,_,G,_,H,_,I,_),
	word(V1,_,A,_,D,_,G,_),	
	word(V2,_,B,_,E,_,H,_),
	word(V3,_,C,_,F,_,I,_).