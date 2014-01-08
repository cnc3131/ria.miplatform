/* =================================================
***************************************************
*** *************** 분모/분자 Graph ****************  ***
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


//-------초기 설정----------------------------------------------------------------------
var Moving:Array = ["Back.easeIn","Back.easeOut","Back.easeInOut","Bounce.easeOut","Elastic.easeOut","Elastic.easeInOut","None.easeNone","None.easeIn","None.easeOut","None.easeInOut","Regular.easeIn","Regular.easeOut","Regular.easeInOut","Strong.easeIn","Strong.easeOut","Strong.easeInOut"];
//↑ 포인트의 움직임을 이중에서 고른다. 의미적으로의 위치는 적당하지 않지만 진행적으로는 이곳이 적당하다.
var index:Array = ["index_Name","value_Index","L_m","R_m","bar_val","line_val"]; // 감시해야 할 변수명 지정
var index_color = ["0xBF0000","0xBF7300","0x00BF00","0xBF26BF","0xBF4C4C","0x009900","0xBF7373","0xFF9900","0x006600","0xBF0073"];
//index_Name:범례,value_Index:x축 단위,bar_val:막대그래프값들,line_val:선그래프값.
var Result:Array = []; 
var my_mc = this;
var Width = horizon._width; //표의 길이
var Height = vertical._height; //표의 높이
//---------초기 무비 설정---------------------------------------------------------------------
horizon._visible = false;
vertical._visible = false;
vertical2._visible = false;

this.barset._visible = false; //복사하기위한 박스 감추기
this.line._visible = false;
//----------------------------------------------------------------------------------------
//변수 감시 규칙
this.createEmptyMovieClip("watch",4040);
for (var i=0; i<index.length; i++ ) {
	this.watch[index[i]] = undefined;
}

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
		_global.L_m_BU = _root.L_m;
		_global.R_m_BU = _root.R_m;
		_global.bar_val_BU = _root.bar_val;
		_global.line_val_BU = _root.line_val;
		_global.value_Index_BU = _root.value_Index;
		delete this.onEnterFrame;
		gotoAndPlay(2);
	}
}
//----------------------------------------------------------------------------------------
this.watch.onEnterFrame = watching;

stop();
/*
_root.index_Name = "Target,Result,Achievement";
_root.value_Index = "SEA,CCC,DDD,RRRR";//,OOOO,CCF,ROR,AVA,OOO";//,SDE";
_root.L_m = "count";
_root.R_m = "Achv.(%)";
_root.bar_val = "9234-5231,300-4123,606-2212,7900-9231";//,4323-7902,10232-5843,0-2123,300-511,200-250";//,300-350";
_root.line_val = "105,110,20,80";//,0,100,150,10,89";//,73";
*/