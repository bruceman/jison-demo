var compiler = require('./html-compiler');

var result = compiler.compile('<div id="test" class="red"><span class="green"></span></div>');

console.log(result)