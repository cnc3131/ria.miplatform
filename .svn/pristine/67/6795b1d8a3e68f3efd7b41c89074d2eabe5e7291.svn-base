//-------------------만든이 조중열의 범용 무빙 클래스----------------------------------
import mx.transitions.Tween;

class GcMove {
	private var _mc:MovieClip;
	private var _duration:Number;
	private var tweenX:Tween;
	private var tweenY:Tween;
	
	public var onMotionStarted:Function;
	public var onMotionFinished:Function;
	
	public function get duration():Number {
		return _duration;
	}
	public function set duration(duration:Number):Void {
		_duration = duration;
		tweenX.continueTo(tweenX.finish,_duration);
		tweenY.continueTo(tweenY.finish,_duration);
	}
	function get x():Number {
		return getPosition().x;
	}
	function set x(x:Number):Void {
		setPosition(x,_mc._y);
	}
	function get y():Number {
		return getPosition().y;
	}
	function set y(y:Number):Void {
		setPosition(y,_mc._y);
	}
	function set tx(x:Number):Void {
		moveTo(x,_mc._x);
	}
	function set ty(y:Number):Void {
		moveTo(_mc._x,y);
	}
	//GuyMove
	function GcMove(_mc:MovieClip,func:Function,duration:Number,useSeconds:Boolean) {
		if (_mc == undefined && typeof _mc!="movieclip") {
			trace(_mc);
			trace("* * Error * * there is no MovieClip");
			return;
		}
		
		this._mc = _mc;
		this.duration = duration;
		
		tweenX = new Tween(_mc,"_x",func,_mc._x,_mc._x,0,useSeconds);
		tweenY = new Tween(_mc,"_y",func,_mc._y,_mc._y,0,useSeconds);
		tweenX.stop();
		tweenY.stop();
		
		this.onMotionFinished = _onMotionFinished;
		this.onMotionStarted = _onMotionStarted;
		tweenX.addListener(this);
	}
	public function _onMotionStarted() {
		trace("notice >> tween motion STARTed");
	}
	public function _onMotionFinished() {
		trace("Notice>> tween motion FINISHed");
	}
	public function moveTo():Void {
		if (arguments.length > 1) {
			tweenX.continueTo(arguments[0],_duration);
			tweenY.continueTo(arguments[1],_duration);
		} else {
			if (typeof arguments[0] == "movieclip") {
				tweenX.continueTo(arguments[0]._x,_duration);
				tweenY.continueTo(arguments[0]._y,_duration);
			} else {
				trace ("** Runtime Error ** type mismatch error:parameter in moveTo must be MovieClip");
			}
		}
	}
	public function getPosition():Object {
		return {x:_mc._x, y:_mc._y};
	}
	public function setPosition(x:Number,y:Number):Void {
		if (arguments.length == 0)
			return;
		tweenX.stop();
		tweenY.stop();
		tweenX.position = tweenX.finish = tweenX.begin = x;
		tweenY.position = tweenY.finish = tweenY.begin = y;
	}
}








