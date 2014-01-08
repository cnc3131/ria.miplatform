//---------------------바의 움직임을 정의 하는 클래스--------------------------
import mx.transitions.Tween;

class BarMove {
	private var _mc:MovieClip;
	private var _duration:Number;
	private var tweenY:Tween;
	
	public var onMotionStarted:Function;
	public var onMotionFinished:Function;
	
	public function get duration():Number {
		return _duration;
	}
	public function set duration(duration:Number):Void {
		_duration = duration;
		tweenY.continueTo(tweenY.finish,_duration);
	}
	function get y():Number {
		return getPosition().y;
	}
	function set y(y:Number):Void {
		setPosition(y,_mc._height);
	}
	function set ty(y:Number):Void {
		moveTo(y,_mc._height);
	}

	//GuyMove
	function BarMove(_mc:MovieClip,func:Function,duration:Number,useSeconds:Boolean) {
		if (_mc == undefined && typeof _mc!="movieclip") {
			trace("* * Error * * there is no MovieClip");
			return;
		}
		
		this._mc = _mc;
		this.duration = duration;
		
		tweenY = new Tween(_mc,"_height",func,_mc._height,_mc._height,0,useSeconds);
		tweenY.stop();
		
		this.onMotionFinished = _onMotionFinished;
		this.onMotionStarted = _onMotionStarted;
		tweenY.addListener(this);
	}
	public function _onMotionStarted() {
		trace("notice >> tween motion STARTed");
	}
	public function _onMotionFinished() {
		trace("Notice>> tween motion FINISHed");
	}
	
	public function moveTo():Void {
		if (arguments.length > 0) {
			tweenY.continueTo(arguments[0],_duration);
		} else {
			if (typeof arguments[0] == "movieclip") {
				tweenY.continueTo(arguments[0]._height,_duration);
			} else {
				trace ("** Runtime Error ** type mismatch error:parameter in moveTo must be MovieClip");
			}
		}
	}
	public function getPosition():Object {
		return {y:_mc._height};
	}
	public function setPosition(y:Number):Void {
		if (arguments.length == 0)
			return;
		tweenY.stop();
		tweenY.position = tweenY.finish = tweenY.begin = y;
	}
}