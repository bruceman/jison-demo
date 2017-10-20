var parser = require('./simple-parser').parser;

// register custom helper functions
parser.yy = {
    Program: function (data) {
        console.log("Program:");
        console.log(data);
        this.statements = data;

        this.compile = function () {
            var statements = this.statements;
            return function (context) {
                var result = "";
                statements.forEach(function(stat) {
                    if (stat.type == "text") {
                        result += stat.data;
                    } else if (stat.type == "exp") {
                        result += context[stat.data];
                    } else {
                        throw new Error("Invlaid type");
                    }
                }, this);

                return result;
            };
            
        }
    },
    TextStatement: function (data) {
        console.log("TextStatement:");
        this.type = "text";
        this.data = data;
        console.log(data);
    },
    ExpressionStatement: function (data) {
        console.log("ExpressionStatement:");
        this.type = "exp";
        this.data = data;
        console.log(data);
    }
};

/** export */
module.exports = {
    compile: function (str) {
        var program = parser.parse(str);
        return program.compile();
    }
}

