var parser = require('./html').parser;

var result = parser.parse('<div id="test"></div>');

console.log(result)