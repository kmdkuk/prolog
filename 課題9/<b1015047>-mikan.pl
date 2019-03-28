% File:    <b1015047>-mikan.pl
% Author:  Kamada Kouki
% Date:    2017/07/11
% Purpose: homework Lecture 9
%   "I declare that this represents my own work, with no unacknowledged
%    use of external information."

%sweetnessをrichをyesに，medium・poorをnoにした

val(m1,sweetness,yes).
val(m1,size,yes).
val(m1,gloss,yes).
val(m1,firstclass,yes).

val(m2,sweetness,yes).
val(m2,size,no).
val(m2,gloss,yes).
val(m2,firstclass,yes).

val(m3,sweetness,yes).
val(m3,size,no).
val(m3,gloss,no).
val(m3,firstclass,yes).

val(m4,sweetness,no).
val(m4,size,yes).
val(m4,gloss,yes).
val(m4,firstclass,yes).

val(m5,sweetness,no).
val(m5,size,no).
val(m5,gloss,yes).
val(m5,firstclass,no).

val(m6,sweetness,no).
val(m6,size,yes).
val(m6,gloss,no).
val(m6,firstclass,no).

val(m7,sweetness,no).
val(m7,size,no).
val(m7,gloss,no).
val(m7,firstclass,no).

val(m8,sweetness,no).
val(m8,size,no).
val(m8,gloss,yes).
val(m8,firstclass,no).

%| ?- dtlearn(firstclass,[m1,m2,m3,m4,m5,m6,m7,m8],[sweetness,size,gloss],DT).
%DT = if(sweetness=yes,yes,if(size=yes,if(gloss=yes,yes,no),no)) ? 
%yes
%sweetnessがyesのもの，sizeがyesかつglossがyesのものがfirstclass