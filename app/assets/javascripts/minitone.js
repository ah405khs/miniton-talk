function fnChkByte(obj, maxByte){
var str = obj.value;
var str_len = str.length;

var rbyte = 0;
var rlen = 0;
var one_char = "";
var str2 = "";

for(var i=0; i<str_len; i++){
one_char = str.charAt(i);
if(escape(one_char).length > 4){
    rbyte += 1;                                         //한글1Byte
}else{
    rbyte++;                                            //영문 등 나머지 1Byte
}

if(rbyte <= maxByte){
    rlen = i+1;                                          //return할 문자열 갯수
}
}

if(rbyte > maxByte){
    alert(maxByte+"자를 초과하였습니다!");
    str2 = str.substr(0,rlen);                                  //문자열 자르기
    obj.value = str2;
    fnChkByte(obj, maxByte);
}else{
    document.getElementById('byteInfo').innerText = rbyte;
}
}


