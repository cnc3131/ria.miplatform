//------------------보여주기----------------------------------------------------
var setView:Function = function(_array:Array) {
	//배열을 다시정리;
	var p_array:Array = []; //타이틀과 값들을 한 배열로 만든다.
	p_array[0] = _array[0];
	var temp_array:Array = _array[1].split(",");//Score,Result,Achvement 값들을 분리한다.
	p_array = p_array.concat(temp_array);
	var magic:Number = 30 / p_array.length;//???
	
	for (var t=0; t<p_array.length; t++) {
		var space:Number = (this.back._height - magic) / p_array.length * t + magic;
		
		if (t == 0 && p_array[0]) {
			this.createTextField("ESC",10,70,0,150,50);
			this.createTextField("ESC_",9,71,0,150,50);
			var name_fmt:TextFormat = new TextFormat();
			name_fmt.font = "Helvetica";
			name_fmt.size = 13;
			name_fmt.bold = true;
			name_fmt.italic = false;
			this.ESC.text = _array[0];
			name_fmt.color = 0x001122;
			this.ESC.setTextFormat(name_fmt);
			this.ESC.autoSize = "left";
			this.ESC._y = space;
			
			this.ESC_.text = _array[0];
			name_fmt.color = 0x77AACC;
			this.ESC_.setTextFormat(name_fmt);
			this.ESC_.autoSize = "left";
			this.ESC_._x = this.ESC._x +1;
			this.ESC_._y = space+1;
		} else if (t > 0) {
			var TRA:Array = p_array[t].split(":");
			this.createTextField("T"+t,this.getNextHighestDepth(),70,0,150,60);
			this.createTextField("k"+t,this.getNextHighestDepth(),70,0,150,60);
			this.createTextField("V"+t,this.getNextHighestDepth(),70,0,150,60);

			var num_fmt:TextFormat = new TextFormat();
			var num2_fmt:TextFormat = new TextFormat();
			num_fmt.font = "Helvetica";
			num_fmt.size = 13;
			num_fmt.color = 0x000000;
			num_fmt.bold = true;
			num_fmt.italic = false;
			
			this["T"+t].text = TRA[0];
			this["T"+t].setTextFormat(num_fmt);
			this["T"+t].autoSize = "left";
			this["T"+t]._y = space;
			
			this["k"+t].text = ":";
			this["k"+t].setTextFormat(num_fmt);
			this["k"+t].autoSize = "left";
			if (this["T"+(t-1)] != undefined && this["T"+(t-1)]._width > this["T"+t]._width) {
				this["k"+t]._x =  this["k"+(t-1)]._x;
			} else {
				this["k"+t]._x =  this["T"+t]._x + this["T"+t]._width +4;
				if (this["k"+(t-1)] != undefined) {
					this["k"+(t-1)]._x =  this["k"+t]._x;
					this["V"+(t-1)]._x =  this["k"+t]._x + this["k"+t]._width +4;
				}
			}
			this["k"+t]._y = space;
			
			this["V"+t].text = TRA[1];
			this["V"+t].setTextFormat(num_fmt);
			this["V"+t].autoSize = "left";
			if (this["V"+(t-1)] != undefined && this["V"+(t-1)]._width > this["V"+t]._width) {
				this["V"+t]._x = this["V"+(t-1)]._x + (this["V"+(t-1)]._width - this["V"+t]._width);
			} else {
				this["V"+t]._x = this["k"+t]._x + this["k"+t]._width +4;
				if (this["V"+t] != undefined) this["V"+(t-1)]._x = this["V"+t]._x + (this["V"+t]._width - this["V"+(t-1)]._width);
			}
			this["V"+t]._y = space;
		}
	}
	
	if (_array[2]) {
		if (_array[2] == "S" || _array[2] == "s") {
			weather.gotoAndPlay("sun");
			num2_fmt.color = 0x0000FF;
			this["V1"].setTextFormat(num2_fmt);
			this["V2"].setTextFormat(num2_fmt);
		} else if (_array[2] == "C" || _array[2] == "c") {
			weather.gotoAndPlay("cloud");
			num2_fmt.color = 0x242424;
			//this["R"].setTextFormat(num2_fmt);
		} else if (_array[2] == "R" || _array[2] == "r") {
			weather.gotoAndPlay("rain");
			num2_fmt.color = 0xBF6000;
			//this["R"].setTextFormat(num2_fmt);
		} else if (_array[2] == "W" || _array[2] == "w") {
			weather.gotoAndPlay("warning");
			this.bgboard.gotoAndPlay("warning");
			num2_fmt.color = 0xFF0000;
			this["V1"].setTextFormat(num2_fmt);
			this["V2"].setTextFormat(num2_fmt);
		} else if (_array[2] == "N" || _array[2] == "N" || _array[2] == "" ||_array[2] == " " ) {
			weather.gotoAndPlay("null");
		}
	}

}
//-------------------------------------------------------------------------------
//인터발적용
this.createEmptyMovieClip("monitor",4040);
var Mwatching:Function = function() {
	if (s_monitor != _root[monitor] && _root[monitor] > 1) {
		interval = setInterval(stopAll,Number(_root[monitor])*1000,_root._mc.weather);
		s_monitor = _root[monitor];
	}
}
//-------------------------------------------------------------------------------
this.monitor.onEnterFrame = Mwatching;
//--------모든무비정지--------------------------------------------------------
var stopAll:Function = function(obj) {
	for (var name in obj) {
		if (typeof(obj[name]) == "movieclip") {
			trace(obj[name]);
			obj[name].stop();
			stopAll(obj[name]);
		}
	}
	clearInterval(this.interval);
}
//-------------------------------------------------------------------------------
setView(this.Result);

//stop();