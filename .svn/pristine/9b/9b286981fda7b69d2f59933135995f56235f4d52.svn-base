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
var colors:Array = [["0x419cd7","0x2d6c94"],["0x41bed7","0x2d8394"],["0x41d791","0x2d9464"],["0x92e57e","0x25b100"],["0xb1d741","0x7a942d"]
																,["0xd7b241","0x947b2d"],["0xd76241","0x94442d"],["0xd74181","0x942d59"],["0xa641d7","0x732d94"],["0x4142d7","0x2d2e94"] ];
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
		_global.bar_val_BU = _root.bar_val;
		_global.value_Index_BU = _root.value_Index;
										   
		delete this.onEnterFrame;
		gotoAndPlay(2);
		trace(bar_val_BU);
		trace(value_Index_BU);
	}
}
this.watch.onEnterFrame = watching;
//------------------------------------------------------------------------------------------------------
stop();
/*
_root.value_Index = "RRR1111,OTR,ISR,ERR,STR,CCR,WFB";
_root.bar_val = "23,14,55,8,9,10,18";
*/