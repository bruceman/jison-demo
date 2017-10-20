%x mu

%%

[^\x00]*?/("{{")    {
                        this.begin("mu");
                        if (yytext) {
                            console.log("1. TXT:" + yytext)
                            return "TXT";
                        }
                    }

[^\x00]+    {
                console.log("2. TXT:" + yytext)
                return "TXT";
            }


<mu>"{{"    {
                console.log("START_EXPR:" + yytext);
                return "START_EXPR";
            }
<mu>[a-zA-Z]+   { 
                    console.log("EXPR:" + yytext);
                    return "EXPR"; 
                }

<mu>"}}"    {
                console.log("END_EXPR:" + yytext);
                this.popState();
                return "END_EXPR";
            }

<mu>[\s]*   { console.log("skip blank"); }
<mu>.+ { console.log("Ohter:" + yytext); }


<INITIAL,mu><<EOF>>     { return "EOF"; }

