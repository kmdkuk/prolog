% File:    <b1015047>-japanese1.pl
% Author:  Kamada Kouki
% Date:    2017/07/11
% Purpose: homework Lecture 9
%   "I declare that this represents my own work, with no unacknowledged
%    use of external information."

val(e1, tall, yes).
val(e1, blue_eyes, yes).
val(e1, blond, yes).
val(e1, japanese, yes).

val(e2, tall, yes).
val(e2, blue_eyes, no).
val(e2, blond, yes).
val(e2, japanese, yes).

val(e3, tall, yes).
val(e3, blue_eyes, yes).
val(e3, blond, no).
val(e3, japanese, no).

val(e4, tall, no).
val(e4, blue_eyes, yes).
val(e4, blond, no).
val(e4, japanese, no).

val(e5, tall, no).
val(e5, blue_eyes, no).
val(e5, blond, yes).
val(e5, japanese, yes).

val(e6, tall, no).
val(e6, blue_eyes, no).
val(e6, blond, no).
val(e6, japanese, no).

%B.問題Aにある質問のSICStusの出力結果を書きなさい。
%| ?- dtlearn(japanese, [e1,e2,e3,e4,e5,e6], [blond,blue_eyes,tall], DT).
%DT = if(blond=yes,yes,no) ? 
%yes

%C.以下の4つの質問のSICStusの出力結果とその説明を書きなさい。
%| ?- dtlearn(blond, [e1,e2,e3,e4,e5,e6], [japanese,blue_eyes,tall], DT).
%DT = if(japanese=yes,yes,no) ? 
%yes
%japanese things are blond, everything else is not blond!

%| ?- dtlearn(blue_eyes, [e1,e2,e3,e4,e5,e6], [japanese,blond,tall], DT).
%no
%japaneseとblondとtallはblue_eyesを満たさない

%| ?- dtlearn(tall, [e1,e2,e3,e4,e5,e6], [japanese,blue_eyes,blond], DT).
%no
%japaneseとblue_eyesとblondはtallをみたさない

%| ?- dtlearn(tall, [e1,e2,e3,e4,e5,e6], [japanese,blue_eyes,blond,tall], DT).
%DT = if(tall=yes,yes,no) ? 
%yes
%tall things are tall, everything else is not tall!
