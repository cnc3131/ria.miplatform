/* =================================================
***************************************************
*** *************** PI Graph ****************  ***
*** 제 작  자 :  조중열 guycat@kornet.net                      ***
*** 도      구 :   Flash MX2004 7.2(ActionScript 2.0기반) ***
*** 제작시점 :   2006.02                                                 ***
***************************************************
===================================================*/
System.useCodepage = true; //한글트루폰트
//---------------폰트 셋업-----------------
var my_fmt:TextFormat = new TextFormat();
my_fmt.font = "Helvetica";
my_fmt.color = 0xFFFFFF;
my_fmt.bold = true;
my_fmt.italic = false;
//my_fmt.align = "center";


//-----초기설정--------------------------------------------------------------------------------------
var index:Array = ["value_Index","bar_val"]; // 감시해야 할 변수명 지정
var colors:Array = [["0x59a3df","0x1777ad"],["0xaad1f1","0x5cafd5"],["0x0000FF","0x000099"],["0x00FF00","0x009900"],["0x99FF00","0x669900"]
																,["0x66FF00","0x339900"],["0x00FF99","0x009966"],["0x00FF33","0x009933"],["0x99FF99","0x669966"],["0x33FF33","0x339933"] ];
var Result:Array = []; 
var my_mc = this;
note._visible = false;
//----------------------------------------------------------------------------------------------------
//변수 감시 규칙
this.createEmptyMovieClip("watch",4040);
for (var i=0; i<index.length; i++ ) {
	this.watch[index[i]] = undefined;
}
//----감시자--------------------------------------------------------------------------------------------
var watching:Function = function() {
	var chk = 0;
	for (var i=0; i<index.length; i++) {
		if (this[index[i]] != "OK" && this[index[i]] != _root[index[i]]) {
			Result[i] = _root[index[i]];
			this[index[i]] = "OK";
		}
	}
	for (var i=0; i<index.length; i++) {
		chk = (this[index[i]] == "OK")? chk+1:chk;
	}
	if (chk == index.length) {
		delete this.onEnterFrame;
		gotoAndPlay(2);
	}
}
this.watch.onEnterFrame = watching;
//------------------------------------------------------------------------------------------------------
stop();
/*
_root.value_Index = "RRR1111,OTR,ISR,ERR,STR,CCR,WFB";
_root.bar_val = "23,14,55,8,9,10,18";
*/