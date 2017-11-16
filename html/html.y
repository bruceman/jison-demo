 %ebnf
 %start Document
 %%
 Document
   : ElementList EOF -> $1
   ;

 ElementList
   : Element
   | ElementList Element 
   ;

 Element
   : "<" IDENT AttrList "/" ">" -> new yy.Element($2, $3)
   | "<" IDENT AttrList ">" "<" "/" IDENT ">" -> new yy.Element($2, $3)
   | "<" IDENT AttrList ">" ElementList  "<" "/" IDENT ">" -> new yy.Element($2, $3, $5)
   ;

 AttrList :
   | Attr+
   ;

 Attr
   : IDENT "=" STRING -> new yy.Attribute($1, $3.substr(1, $3.length-2))
   ;