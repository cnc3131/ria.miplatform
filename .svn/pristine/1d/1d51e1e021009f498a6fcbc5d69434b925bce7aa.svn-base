System.useCodepage = true; //한글을 위한 트루폰트
Stage.showMenu = false;
//---------------폰트 셋업--------------------------------------
var my_fmt:TextFormat = new TextFormat();
my_fmt.font = "Helvetica";
my_fmt.size = 12;
my_fmt.color = 0x000000;
my_fmt.bold = false;
my_fmt.italic = false;
//my_fmt.align = "center";


//----------------초기설정-----------------------------------
var index:Array = ["esc_Name","num_Val","Weather"];
var Result:Array = [];
var my_mc = this;
var monitor:String = "interval";//Auto Stop
var interval:Number;
//--------------------------------------------------------------
this.createEmptyMovieClip("watch",4040);

for (var i=0; i<index.length; i++ ) {
	this.watch[index[i]] = undefined;
}
//---------------감시자--------------------------------------------------
var watching:Function = function() {
	for (var i=0; i<index.length; i++) {
		if (this[index[i]] != "OK" && this[index[i]] != _root[index[i]]) {
			Result[i] = _root[index[i]];
			this[index[i]] = "OK";
		}
	}
	if (this[index[0]] == "OK" &&  this[index[1]] == "OK"  && this[index[2]] == "OK" ) {
		delete this.onEnterFrame;
		gotoAndPlay(2);
	}
}
//----------------------------------------------------------------
this.watch.onEnterFrame = watching;
//----------------------------------------------------------------
stop();

/*
_root.esc_Name = "Aosodf";
_root.num_Val = "Result:82.3%,Achv.:88%";
_root.Weather = "w";
_root.interval = 5;
*/