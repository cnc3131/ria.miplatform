// --------------------바의 움직임이나 설정에 관한 클래스-----------------------------
import mx.transitions.easing.*;
import BarMove;

class ND_setbar extends MovieClip {
	function ND_setbar() {
		for(var name in this) {
			if (typeof(this[name]) == "movieclip")  this[name]._visible =0;
		}
	}
	//--------------기본 설정----------------------------------------------------------------
	private var _mc:MovieClip;
	private var _mc2:MovieClip;
	private var paint:Object;
	//-----------사이즈 변환-----------------------------------------------------------------
	public function _reSize(size:Number):Void {
		for (var name in this) {
			if (typeof(this[name]) == "movieclip") {
				this[name]._xscale = this[name]._yscale = size;
			}
		}
	}
	//------------실행----------------------------------------------------------------
	public function _plAy(bar_num:Number,_array:Array,_mc:MovieClip,hi:Number,wid:Number,limit:Number,func:Function):Void {
		this._mc = _mc;
		var nameplus = _mc._name;
		
		var sign_fmt:TextFormat = new TextFormat();
		sign_fmt.font = "Helvetica";
		sign_fmt.color = 0x000000;
		sign_fmt.size = 14;
		sign_fmt.bold = true;
		sign_fmt.italic = false;
		
		for (var i=0; i<bar_num; i++) {
			if (Number(_array[i]) > 0) {
				//trace(Math.round((hi*_array[i]/limit)*10)/10);
				var viewhi = Math.round((Math.round((hi*_array[i]/limit)*10)/10)/(_mc["arca"+i]._yscale/100));
				var viewhi = Math.round((Math.round((hi*_array[i]/limit)*10)/10)/(_mc["arca_"+i]._yscale/100));
				//trace(Math.round((Math.round((hi*_array[i]/limit)*10)/10)*_mc["arca"+i]._xscale/100));
				
				_mc["arca"+i]._visible = true;
				_mc["arca_"+i]._visible = true;
				_mc["arca"+i]._x = 0-((_mc["arca"+i]._width*bar_num)/2)+(_mc["arca"+i]._width*i);
				_mc["arca_"+i]._x = 8-((_mc["arca_"+i]._width*bar_num)/2)+(_mc["arca_"+i]._width*i);
				_mc["arca_"+i]._y = -8;
				//text--start
				_mc._parent["signbod"].createTextField("s"+nameplus+i,_mc._parent["signbod"].getNextHighestDepth(),0,0,100,50);
				_mc._parent["signbod"].selectable = false;
				_mc._parent["signbod"]["s"+nameplus+i].text = _array[i];
				_mc._parent["signbod"]["s"+nameplus+i].setTextFormat(sign_fmt);
				_mc._parent["signbod"]["s"+nameplus+i].autoSize = "center";
				_mc._parent["signbod"]["s"+nameplus+i].selectable = false;
				_mc._parent["signbod"]["s"+nameplus+i]._x = _mc._x + _mc["arca"+i]._x + _mc["arca"+i]._width/2 - _mc._parent["signbod"]["s"+nameplus+i]._width/2;
				_mc._parent["signbod"]["s"+nameplus+i]._y = (viewhi > 0)? -(viewhi/2):- (_mc._parent["signbod"]["s"+nameplus+[i]]._height/2);
				//text--end
				
				_mc.stand_bar(viewhi,_mc["arca"+i],func);
				_mc.stand_bar(viewhi,_mc["arca_"+i],func);
			}
		}
	}
	//-----------막대 기상------------------------------------------------------------------
	public function stand_bar(top:Number,_mc:MovieClip,func:Function):Void {
		this._mc2 = _mc;
		paint = new BarMove(_mc2.body,func,20);
		paint.moveTo(top);
		paint.onMotionFinished = function() {
			delete _mc._parent.onEnterFrame;
			_mc._parent._parent._parent.chk_barani();
		}
		_mc2.onEnterFrame = _onEnterFrame;
	}
	//-------------------------------------------------------------------------------------
	private function _onEnterFrame() {
		this["head"]._y = -(this["body"]._height);
	}
}