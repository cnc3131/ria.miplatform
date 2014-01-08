//-----------------Depth 를 동적으로 변경하는 클래스-----------------------------
class DepthChange {
	function DepthChange(_mc:MovieClip) {
		this._mc = _mc;
		myDepth = _mc.getDepth();
	}
	
	var _mc:MovieClip;
	var myDepth:Number;
	
	private function Change ():Void {
		_mc.swapDepths(_root.getNextHighestDepth());
	}
	private function ReMovie ():Void {
		_mc.swapDepths(myDepth);
	}
}