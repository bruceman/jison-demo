 %ebnf
 %start Document
 %%
 Document
   : ElementList EOF
   ;

 ElementList
   : Element
   | ElementList Element
   ;

 Element
   : "<" IDENT AttrList "/" ">"
   | "<" IDENT AttrList ">" "<" "/" IDENT ">"
   | "<" IDENT AttrList ">" ElementList  "<" "/" IDENT ">"
   ;

 AttrList
   : Attr+
   |
   ;

 Attr
   : IDENT "=" STRING
   ;