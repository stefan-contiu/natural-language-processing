%%% ---------------------------------------------------
%%% DCG Grammar
%%%
s(s(N,V))-->np(N),vp(V).

np(np(D,N))-->det(D),np2(N).

np2(np2(A,N))-->adj(A),np2(N).

np2(np2(N))-->n(N).

vp(vp(V))-->iv(V).

vp(vp(V,N))-->tv(V),np(N).

vp(vp(V,N,P))-->dv(V),np(N),pp(P).

pp(pp(P,N))-->p(P),np(N).


%%% ---------------------------------------------------
%%% LEXICON
%%%
det(det(the))-->[the].
det(det(a))-->[a].

n(n(student))-->[student].
n(n(professor))-->[professor].
n(n(director))-->[director].

adj(adj(good))-->[good].
adj(adj(bad))-->[bad].
adj(adj(smart))-->[smart].

tv(tv(asks))-->[asks].
iv(iv(sleeps))-->[sleeps].
dv(dv(sends))-->[sends].

p(p(to))-->[to].


%%% ---------------------------------------------------
%%% TESTS
%%%
t00(S,A):-s(A,[a,student,sleeps],[]),s(A,S,[]).
t01(S,A):-s(A,[the,smart,professor,sleeps],[]),s(A,S,[]).
t02(S,A):-s(A,[the,smart,professor,asks,the,bad,student],[]),s(A,S,[]).
t03(S,A):-s(A,[the,smart,professor,sends,a,bad,student,to,the,director],[]),s(A,S,[]).
