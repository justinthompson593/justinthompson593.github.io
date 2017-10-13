var symbolSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_-+=*";

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
	var out = "";
	var sum = 0;
	sum += innerProduct(pWord, pWord);
	sum += totalSum(pWord, pWord);
	out += sum;
	out += outerProduct(pWord, pWord);
	
	document.getElementById("output").innerHTML = out;
	
	
}




window.onload = function() {
	
	parseUrl();
	
};











