var compiler = require('./simple-compiler');

var str = "hello {{name}}, welcome {{ msg }}. It works well.";
var template = compiler.compile(str);
var result = template({name: "bruce", msg: "this is a test"})
console.log("********************")
console.log(result);