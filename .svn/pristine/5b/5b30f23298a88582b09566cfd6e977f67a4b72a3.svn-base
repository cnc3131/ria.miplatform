//-----------------맵들의 움직임을 합의본 클래스------------------------
import mx.transitions.Tween;

class MapMove {
	private var _mc:MovieClip;
	private var _duration:Number;
	private var tweenX:Tween;
	private var tweenY:Tween;
	private var tweenXs:Tween;
	private var tweenYs:Tween;
	private var tweenA:Tween;
  //----------------기본 설정들------------------------------------	
	public var onMotionStarted:Function;
	public var onMotionFinished:Function;
	
	public function get duration():Number {
		return _duration;
	}
	public function set duration(duration:Number):Void {
		_duration = duration;
		tweenX.continueTo(tweenX.finish,_duration);
		tweenY.continueTo(tweenY.finish,_duration);
		tweenXs.continueTo(tweenXs.finish,_duration);
		tweenYs.continueTo(tweenYs.finish,_duration);
		tweenA.continueTo(tweenA.finish,_duration);
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
	function get z():Number {
		return getPosition().z;
	}
	function set z(z:Number):Void {
		setPosition(z,_mc._xscale);
	}
	function get a():Number {
		return getPosition().a;
	}
	function set a(a:Number):Void {
		setPosition(a,_mc._alpha);
	}

	function set tx(x:Number):Void {
		moveTo(x,_mc._x);
	}
	function set ty(y:Number):Void {
		moveTo(_mc._x,y);
	}
	function set txs(z:Number):Void {
		moveTo(z,_mc._xscale);
	}
	function set tyx(z:Number):Void {
		moveTo(_mc._xscale,z);
	}
	function set ta(a:Number):Void {
		moveTo(a,_mc._alpha);
	}

	//-------------------------GuyMove에서 불필요한 부분은 제거-------------------------------
	function MapMove(_mc:MovieClip,func:Function,duration:Number,useSeconds:Boolean) {
		if (_mc == undefined && typeof _mc!="movieclip") {
			trace("* * Error * * there is no MovieClip");
			return;
		}
		
		this._mc = _mc;
		this.duration = duration;
		
		tweenX = new Tween(_mc,"_x",func,_mc._x,_mc._x,0,useSeconds);
		tweenY = new Tween(_mc,"_y",func,_mc._y,_mc._y,0,useSeconds);
		tweenXs = new Tween(_mc,"_xscale",func,_mc._xscale,_mc._xscale,0,useSeconds);
		tweenYs = new Tween(_mc,"_yscale",func,_mc._yscale,_mc._yscale,0,useSeconds);
		tweenA = new Tween(_mc,"_alpha",func,_mc._alpha,_mc._alpha,0,useSeconds);
		tweenX.stop();
		tweenY.stop();
		tweenXs.stop();
		tweenYs.stop();
		tweenA.stop();
		
		//this.onMotionFinished = _onMotionFinished;
		//this.onMotionStarted = _onMotionStarted;
		tweenX.addListener(this);
	}
	public function _onMotionStarted() {
		trace(_mc._name+" notice >> tween motion STARTed");
	}
	public function _onMotionFinished() {
		trace("Notice>> tween motion FINISHed");
	}
	
	public function moveTo():Void {
		if (arguments.length > 3) {
			tweenX.continueTo(arguments[0],_duration);
			tweenY.continueTo(arguments[1],_duration);
			tweenXs.continueTo(arguments[2],_duration);
			tweenYs.continueTo(arguments[2],_duration);
			tweenA.continueTo(arguments[3],_duration);
		} else {
			if (typeof arguments[0] == "movieclip") {
				tweenX.continueTo(arguments[0]._x,_duration);
				tweenY.continueTo(arguments[0]._y,_duration);
				tweenXs.continueTo(arguments[0]._xscale,_duration);
				tweenYs.continueTo(arguments[0]._yscale,_duration);
				tweenA.continueTo(arguments[0]._alpha,_duration);
			} else {
				trace ("** Runtime Error ** type mismatch error:parameter in moveTo must be MovieClip");
			}
		}
	}
	public function getPosition():Object {
		return {x:_mc._x, y:_mc._y,z:_mc._xscale,a:_mc._alpha};
	}
	public function setPosition(x:Number,y:Number,z:Number,a:Number):Void {
		if (arguments.length == 0)
			return;
		tweenX.stop();
		tweenY.stop();
		tweenXs.stop();
		tweenYs.stop();
		tweenA.stop();
		tweenX.position = tweenX.finish = tweenX.begin = x;
		tweenY.position = tweenY.finish = tweenY.begin = y;
		tweenXs.position = tweenXs.finish = tweenXs.begin = z;
		tweenYs.position = tweenYs.finish = tweenYs.begin = z;
		tweenA.position = tweenYs.finish = tweenYs.begin = a;
	}
}