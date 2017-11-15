%x el attr

%%

[^\x00]*?/("<")    {
                        this.begin("el");
                        if (yytext) {
                            console.log("1. TXT:" + yytext)
                            return "TXT";
                        }
                    }

[^\x00]+    {
                console.log("2. TXT:" + yytext)
                return "TXT";
            }


<el>"<"[a-zA-Z]+    {
                yytext = yytext.substr(1).toLowerCase(); //ignore <
                console.log("START_TAG:" + yytext);
                return "START_TAG";
            }
<el>[\s]+   { console.log("skip blank"); }
<el>">" {
    console.log("tag closed");
    return "CLOSE_TAG"
}  
//non space char
<el>[^\x00]   { 
                    this.begin('attr');
                    this.unput(yytext);
                }


<attr>\w+   { 
                    
                    console.log("ATTR name:" + yytext);
                    return "ATTR_NAME"; 
            }
<attr>[\s]+   { console.log("skip blank"); }
<attr>. {
    if (yytext == '=') {
        return "ATTR_EQUAL"; 
    } else {
       // have not value attrbute
        this.popState();
        this.unput(yytext);
    }
}



<mu>"}}"    {
                console.log("END_EXPR:" + yytext);
                this.popState();
                return "END_EXPR";
            }

<mu>[\s]*   { console.log("skip blank"); }
<mu>.+ { console.log("Ohter:" + yytext); }


<INITIAL,mu><<EOF>>     { return "EOF"; }

