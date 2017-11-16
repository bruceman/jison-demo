var parser = require('./html-parser').parser;

// register custom helper functions
parser.yy = {
    Element: function (name, attributes, children) {
        console.log("Element:");
        console.log(name, attributes, children);
        this.name = name;
        this.attributes = attributes;
        this.children = children;

        this.render = function () {
            return "todo";
        }
    },
    Attribute: function (name, value) {
        console.log("Attribute:");
        console.log(name, value)
        this.name = name;
        this.value = value;
    }
};

/** export */
module.exports = {
    compile: function (str) {
        return parser.parse(str);
    }
}

