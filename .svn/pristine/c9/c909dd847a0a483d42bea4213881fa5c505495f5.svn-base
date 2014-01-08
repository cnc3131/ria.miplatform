/* =================================================
***************************************************
*** *************** Line Graph ****************  ***
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


//---------초기 설정-------------------------
var Moving:Array = ["Back.easeIn","Back.easeOut","Back.easeInOut","Bounce.easeOut","Elastic.easeOut","Elastic.easeInOut","None.easeNone","None.easeIn","None.easeOut","None.easeInOut","Regular.easeIn","Regular.easeOut","Regular.easeInOut","Strong.easeIn","Strong.easeOut","Strong.easeInOut"];
//↑ 포인트의 움직임을 이중에서 고른다. 의미적으로의 위치는 적당하지 않지만 진행적으로는 이곳이 적당하다.
var index_color = ["0xFF0000","0xFF9900","0x999900","0x00FF00","0x0000FF","0x000099","0x9900FF","0x000000","0xFF00FF","0xCC6666","0x339933","0x00CCFF","0x6666FF","0x99CCFF","0x999999"];
//↑ 그래프의 컬러
var index:Array = ["note_Index","index_Name","L_m"]; // 감시해야 할 변수명 지정
var Value_ID:Array = [];//값들의 배열을 저장할 배열
var Result:Array = []; 
var my_mc = this;
var note_len:Number;
var Width = horizon._width; //표의 길이
var Height = vertical._height; //표의 높이
horizon._visible = false;
vertical._visible = false;
vertical2._visible = false;

//this.line._visible = false; //복사하기위한 라인 감추기

_root._mc.loadVariables("./text.txt");

//변수 감시 규칙
this.createEmptyMovieClip("watch",4040);
for (var i=0; i<index.length; i++ ) {
	this.watch[index[i]] = undefined;
}
//-------감시자-------------------------------------------
var watching2:Function = function() {
	var chk = 0;
	for (var i=0; i<note_len; i++) {
		if (this["Value"+i] != "OK" && this["Value"+i] != _root["Value"+i]) {
			Value_ID[i] = _root["Value"+i];
			this["Value"+i] = "OK";
		}
	}
	for (var i=0; i<note_len; i++) {
		chk = (this["Value"+i] == "OK")? chk+1:chk;
	}
	if (chk == note_len) {
		delete this.onEnterFrame;
		gotoAndPlay(2);
	}
}
//-------감시하기---------------------------------------------------
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
		
		note_len = Result[0].split(",").length;
		this.createEmptyMovieClip("watch2",4041);
		for (var j=0; j<note_len; j++ ) {
			this.watch2["Value"+j] = undefined;
		}
		this.watch2.onEnterFrame = watching2;
	}
}
//----------------------------------------------------------------
this.watch.onEnterFrame = watching;
//----------------------------------------------------------------
stop();
/*
_root.note_Index = "SEA,STA,SELA,SBSC,SIEL,SEUK";
_root.index_Name = "2005.06,2005.07,2005.08,2005.09,2005.10,2005.11";
_root.L_m = "Achv[%]";
_root.Value0 = "300,203,203,213,23,135";

_root.Value1 = "102,57,49,225,134,89";
_root.Value2 = "280,99,125,238,100,0";
_root.Value3 = "310,220,251,0,280,290";
_root.Value4 = "90,164,304,175,48,111";
_root.Value5 = "68,277,180,70,262,56";
*/
