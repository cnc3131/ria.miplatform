//------------------------모든 지도 들이 갖고있어야 할 마음가짐 클래스--------------------------------
import mx.transitions.easing.*;
import MapMove;

class myMap extends MovieClip {
	function myMap() {
		this._visible = false;
		this._alpha = 0;
		X = this._x; //초기값측정
		Y = this._y;
		Z = this._xscale;
		A = this._alpha;
		_mc = this;
		_mc.allVisible_true();
	}
	//-------------기본 변수----------------------------------------------------
	private var _mc:MovieClip;
	private var moveMap:Object;
	private var alphaMap:Object;
	private var X:Number;
	private var Y:Number;
	private var Z:Number;
	private var A:Number;

	private var XE:Number;//최종도착지점
	private var YE:Number;//최종도착지점
	private var ZE:Number//최종스케일
	private var AE:Number//최종알파
	private var duration:Number = 10;//움직임값
	
	public var state:String = "virgin"; //현재 총괄의 상태를 나타내는 변수
	//---------자기 위치-----------------------------------------------------
	public function XYZ(x:Number,y:Number,z:Number,a:Number):Void { //이동좌표 책정 이클래스는 모든 무비에 적용되므로 각각의 값은 외부에서 set해야 한다
		if (x == undefined || y == undefined || z == undefined || a == undefined) return;
		XE = x;
		YE = y;
		ZE = z;
		AE = a;
	}
	//------------보이기-------------------------------------------------------
	public function Show():Void {
		this._visible = true;
	}
	//--------------스윽------------------------------------------------------
	public function unShow():Void {
		this._visible = false;
	}
	//-------------------------자기 자신에 움직임에 관한 평션-----------------------
	public function Alpha1(num:Number):Void { // 투명1
		alphaMap = new MapMove(this,Strong.easeOut,duration);
		alphaMap.onMotionFinished = function(obj) {
				//if (_root._mc._name == "Global") _root.getURL("Javascript:flash_act('"+_root.Map_index+"');");
			}
		alphaMap.moveTo(X,Y,Z,num);
	}
	//--------------------------------------------------------------------------
	//자기 자신에 움직임에 관한 평션 - 예외성 때문에 생긴거
	public function Alpha1_(num:Number):Void { 
		alphaMap = new MapMove(this,Strong.easeOut,duration);
		alphaMap.moveTo(X,Y,Z,num);
	}
	//--------------------------------------------------------------------------
	public function Alpha2(num:Number):Void {//투명2
		alphaMap = new MapMove(this,Regular.easeOut,duration);
		alphaMap.moveTo(XE,YE,ZE,num);
	}
	//---------------지도 들이대기-----------------------------------------------------------
	public function Thrust(small:String,mam:String):Void {
		moveMap = new MapMove(this,Regular.easeOut,duration);
		moveMap.onMotionFinished = function(obj) {
			if (small) _root.setView2(mam,small);
			if (!small) _root.getURL("Javascript:flash_act('"+_root.Map_index+"');");
		}
		moveMap.moveTo(XE,YE,ZE,AE);
		_mc.state = "all";
	}
	//--------------마이클잭슨 흉내---------------------------------------------------------
	public function Back(next_mc:MovieClip,small:String,mam:String):Void {
		moveMap.onMotionFinished = function(obj) {
			_mc.unShow();
			_root._mc = next_mc;
			if (next_mc._name != "Global") {
				next_mc.Show();
				next_mc.Thrust(small,mam);
				_root.Global.Alpha2(20);
			}
		}
		_mc.allVisible_true();
		_mc.state = "virgin";
		moveMap.moveTo(X,Y,Z,A);
	}
	//--------------------------------------------------------------------------
	//내부 무비 올 히든
	public function allVisible_false():Void {
		for (var name in _mc) {
			if (typeof(_mc[name]) == "movieclip") {
				if (_mc[name] != _mc) {
					_mc[name]._visible = false;
					_mc[name]._alpha = 0;
					_mc[name]._xscale = _mc[name]._yscale = 50;
					_mc[name]._x = _mc[name].X;
					_mc[name]._y = _mc[name].Y;
				}
			}
		}
		if (_mc.shadows != undefined) _mc.shadows.removeMovieClip();
	}
	//--------------------------------------------------------------------------
	//내부 무비 올  온
	public function allVisible_true():Void {
		for (var name in _mc) {
			if (typeof(_mc[name]) == "movieclip") {
				if (_mc[name] != _mc) {
					_mc[name]._visible = true;
					_mc[name]._alpha = 100;
					_mc[name]._xscale = _mc[name]._yscale = 100;
					_mc[name]._x = _mc[name].X;
					_mc[name]._y = _mc[name].Y;
				}
			}
		}
		_mc.state = "all";
		if (_mc.shadows != undefined) _mc.shadows.removeMovieClip();
	}
	//--------------------------------------------------------------------------
	//자신 안에 무비에 관한 평션
	public function View_esc(esc_mc:MovieClip,mam:String):Void {
			esc_mc.duplicateMovieClip("shadows",-100);
			_mc.shadows._visible = true;
			_mc.shadows._x = esc_mc.X;
			_mc.shadows._y = esc_mc.Y;
			_mc.shadows._alpha = 40;
			//trace("x = "+_mc.shadows._x+" alpha="+_mc.shadows._alpha+" y = "+_mc.shadows._y);
			
			esc_mc._visible = true;
			var escname = String(esc_mc._name);
			this["view"+escname] = new MapMove(esc_mc,Regular.easeOut,8);
			var esc_max = (esc_mc._width > esc_mc._height)? esc_mc._width : esc_mc._height;
			var esc_scale = (esc_max > 80)? 100:Math.floor(8000/esc_max);
			
			this["view"+escname].onMotionFinished = function(obj) {
				_root.getURL("Javascript:flash_act_comp('"+mam+"','"+escname+"');");
				//trace(String(mam));
			}
			this["view"+escname].moveTo(-30,-10,esc_scale,100);
	}
	//-------------법인 가리기------------------------------------------------------
	public function unView_esc(esc_mc:MovieClip):Void {
			
			var escname = String(esc_mc._name);
			this["view"+escname] = new MapMove(esc_mc,Regular.easeOut,8);
			this["view"+escname].onMotionFinished = function(obj) {
				_mc._visible = false;//자기자신 unvisible
			}
			
			this["view"+escname].moveTo(esc_mc.X,esc_mc.Y,100,0);
			delete this["view"+escname];
	}

}