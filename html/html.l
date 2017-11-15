%%
\s+                           /* skip whitespace */
"<"                           return "<"
">"                           return ">"
"/"                           return "/"
"="                           return "="
\"[a-zA-Z]+\"                 return "STRING"
[a-zA-Z0-9]+                  return "IDENT"
<<EOF>>                       return "EOF"
.                             return "INVALID"

