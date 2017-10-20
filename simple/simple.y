%start root

%ebnf

%%

root
  : program EOF { return $1; }
  ;

program
  : statement* -> new yy.Program($1)
  ;

statement
  : text -> $1
  | expression -> $1
  ;

text
  : TXT -> new yy.TextStatement($1)
  ;

expression
  : START_EXPR EXPR END_EXPR -> new yy.ExpressionStatement($2)
  ;
