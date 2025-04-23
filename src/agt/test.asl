calcula(4+2*3).

// .term2string(b,"b"): true.
// .term2string(b,X): unifies X with "b".
// .term2string(X,"b"): unifies X with b.
// .term2string(X,"10"): unifies X with 10 (a number term).

// Internal action: .replace(S1,S2,S3,S4).

// Description: replaces S2 by S3 in S1, result in S4.

// .string("home page"): true.
// .string(b(10)): false.
// .string(b): false.
// .string(X): false if X is free, true if X is bound to a string.

// .substring("b","aaa"): false.
// .substring("b","aaa",X): false.
// .substring("a","bbacc"): true.
// .substring("a","abbacca",X): true and X unifies with 0, 3, and 6.
// .substring("a","bbacc",0): false. When the third argument is 0, .substring works like a java startsWith method.
// .substring(a(10),b(t1,a(10)),X): true and X unifies with 5.
// .substring(a(10),b("t1,a(10),kk"),X): true and X unifies with 6.
// .substring(R,a(10,20),5): true and R unifies with "20)".
// .substring(R,a(10,20),5,7): true and R unifies with "20".

// .nth(0,[a,b,c],X): unifies X with a.
// .nth(2,[a,b,c],X): unifies X with c.
// .nth(2,"abc",X): unifies X with c.
// .nth(0,[a,b,c],d): false.
// .nth(0,[a,b,c],a): true.
// .nth(5,[a,b,c],X): error.
// .nth(X,[a,b,c,a,e],a): unifies X with 0 (and 3 if it backtracks).