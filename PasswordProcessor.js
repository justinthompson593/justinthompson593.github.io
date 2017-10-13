var symbolSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_-+=*";

// FUNCTIONS
function myFunction() {
	var x = document.getElementById("password").value;
	document.getElementById("output").innerHTML = x;
}

function clearOutput() {
	var out = "";
	document.getElementById("output").innerHTML = out;
}

function hideOutput() {
	document.getElementById("output").style.color = 'white';
}

function debug(){
	var pwd = document.getElementById("password").value;
	var out = "Password  : " + pwd;
	out +=   "<br>Inner Prod: " + innerProduct(pwd, pwd);
	out +=  "<br>Total Sum : " + totalSum(pwd, pwd);
	out +=  "<br>Outer Prod: " + outerProduct(pwd, pwd);
	out +=  "<br>RevO. Prod: " + outerProduct(pwd, pwd.split("").reverse().join(""));
	var myStr = "ThisIsMyString";
	var binS = toBinary(myStr);
	out +=  "<br>toBinary(" + myStr + "): " + binS;
	
	out += "<br>binToStr(" + binS + "): " + binToString(binS);
	document.getElementById("output").innerHTML = out;
}

function binToString( binStr ){
	if( binStr.length%8 != 0 ){
		return "";
	}
	
	var N = binStr.length / 8;
	var out = "";
	
	for(var i=0; i<N; i++){
		var num = 0;
		
		for(var j=7; j>-1; j--){
			var c = 8*i+j;
			if( binStr.charAt(c) == "1" ){
				num += Math.pow(2, (7-j));
			}
		}
		
		out += String.fromCharCode(num);
	}
	
	return out;
}

function toBinary( str ){
	var out = "";
	for(var i=0; i<str.length; i++){
		var thisNum = "";
		var thisDigit = "";
		var N = 0;
		N += str.charCodeAt(i);
		for(var j=0; j<8; j++){
			thisDigit = N % 2;
			N -= thisDigit;
			N /= 2;
			thisNum = thisDigit + thisNum;
		}
		out += thisNum;
	}
	
	return out;
}

function StringToBinary(){
	var str = document.getElementById("str").value;
	document.getElementById("output").innerHTML = toBinary(str);
}

function BinaryToString(){
	var str = document.getElementById("str").value;
	document.getElementById("output").innerHTML = binToString(str);
}

function printSymbolSet(){
	var out = "";
	
	for(var i=0; i<symbolSet.length; i++){
		out += symbolSet.charAt(i) + " = " + symbolSet.charCodeAt(i) + "<br>";
	}
	
	document.getElementById("output").innerHTML = out;
}

function innerProduct( x, y ){
	if( x.length != y.length ){
		return -1;
	}
	
	var out = 0;
	
	for( var i=0; i<x.length; i++ ){
		out += x.charCodeAt(i) * y.charCodeAt(i);
	}
	
	return out;
}

function totalSum( x, y ){
	var out = 0;
	for( var i=0; i<x.length; i++){
		for( var j=0; j<y.length; j++){
			out += x.charCodeAt(i) * y.charCodeAt(j);
		}
	}
	
	return out;
}

function outerProduct( x, y ){
	var out = "";
	var N = symbolSet.length;
	
	for(var i=0; i<x.length; i++){
		for(var j=0; j<y.length; j++){
			out += symbolSet.charAt( (x.charCodeAt(i)*y.charCodeAt(j)) % N );
		}
	}
	
	return out;
}

function hash(x, y ){
	var out = "";
	var N = symbolSet.length;
}

function getPin(){
	var pwd = document.getElementById("password").value;
	var out = 0;
	
	out += innerProduct(pwd, pwd);
	out += totalSum(pwd, pwd);
	
	document.getElementById("output").innerHTML = out;
}

function getOuterProduct(){
	var pwd = document.getElementById("password").value;
	
	document.getElementById("output").innerHTML = outerProduct(pwd, pwd);
}

function getReverseOuterProduct(){
	var pwd = document.getElementById("password").value;
	
	document.getElementById("output").innerHTML = outerProduct(pwd, pwd.split("").reverse().join(""));
}





function parseUrl(){
	var url = "";
	var fromUrl = [];
	
	url += window.location.href;
	var L = url.length;
	
	var pWord = "";
	
	for(var i=0; i<L; i++){
		if( url[i] == "?" ){			// then there was a flag
			i++;
			
			// p flag: 	p=password
			if( url[i] == "p" ){
				i++;
				if( url[i] == "=" ){
					i++;
					while( i<L  &&  url[i] != "?" ){
						pWord += url[i];
						i++;
					}
					if( url[i] == "?" ){
						i--;
					}
				}
			}
			
			
		}
	}
	
	document.getElementById("password").value = pWord;
	
	
}

window.onload = function() {

	parseUrl();
	
};

function getUrl(){
//	var url = " " + window.location.href + " ";
//	var out = "Original url: " + url + "<br>";
//
////	var idx = out.search("?");
////	var L = url.length();
//	out += "Search   idx: " + -1 + "<br>";
	var url = "";
	var out = "";
	
	url += window.location.href;
	out += "Original url: " + url + "<br>";
	
	var L = url.length;
	
	out += "Length: " + L + "<br>";
	
	for (var i=0; i<L; i++){
		out += "url" + i + " = " + url[i] + "<br>";
	}
	
//
//	out += "url0: " + url[0] + "<br>";
//	var idx = 0;
//
//
//	while( idx < 4096 ){
//		if( url[idx] == "?" ){
//			out += "url = " + idx + "<br>";
//		}
//
//		idx++;
//	}
	
	document.getElementById("output").innerHTML = out;
}




















