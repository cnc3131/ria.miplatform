//------------------------마우스 롤 오버시 동작하는 클래스-----------------------
import DepthChange;

class ND_Depth extends MovieClip {
	function ND_Depth () {
		swap = new DepthChange(this);
		this.useHandCursor = false;
		this.onRollOver = _onRollOver;
		this.onRollOut= _onRollOut;
		this.onDragOut = _onRollOut;
	}
	var Big:Number;
	var Xs:Number;
	var swap:Object;
	
	function _onRollOver() {
		Xs = this._xscale;
		Big = (this._width > this._height)? this._width:this._height;
		swap.Change();
		if (this._name.indexOf("dot") != -1) { this._parent.signbod._visible = true; }
		else { this._parent._parent.signbod._visible = true; }
		this._xscale = this._yscale = Xs+Math.floor(Xs*(1/(Big*1.5)*5));
	}
	function _onRollOut() {
		this._xscale = this._yscale = Xs;
		if (this._name.indexOf("dot") != -1) { this._parent.signbod._visible = false; }
		else { this._parent._parent.signbod._visible = false; }
		swap.ReMovie();
	}
}