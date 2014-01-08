//-------------------선의 움직임 정의 클래스--------------------------------------
class lineGraphMove extends GcMove {
	function lineGraphMove(_mc:MovieClip,func:Function,duration:Number,useSeconds:Boolean) {
		super(_mc,func,duration,useSeconds);
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
	
	public function _onMotionStarted() {
		
	}
}