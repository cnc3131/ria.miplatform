//-----------------------------선의 움직임 클래스----------------------------------
import mx.transitions.easing.*;
import lineGraphMove;

class ND_linebar extends MovieClip {
	
	function ND_linebar() {
			this["ball"]._visible = false;
			//this["sign"]._visible = false;
	}
	//----------------------------------------------------------------------------
	private var _mc:MovieClip;
	//------------원 만들기------------------------------------------------------
	//점을 생성하고 초기 배치
	public function makeShape(_mc:MovieClip,_r:Number,color:Number,alpha:Number):Void {	
		var sqrt2:Number = Math.SQRT2;
		var c = _r*(sqrt2-1);
		var m = _r*sqrt2*.5;
		var x = 0;
		var y = 0;
		_mc.beginFill(color,alpha);
		_mc.moveTo(x+_r,y);
		_mc.curveTo(x+_r,y+c,x+m,y+m);
		_mc.curveTo(x+c,y+_r,x,y+_r);
		_mc.curveTo(x-c,y+_r,x-m,y+m);
		_mc.curveTo(x-_r,y+c,x-_r,y);
		_mc.curveTo(x-_r,y-c,x-m,y-m);
		_mc.curveTo(x-c,y-_r,x,y-_r);
		_mc.curveTo(x+c,y-_r,x+m,y-m);
		_mc.curveTo(x+_r,y-c,x+_r,y);
		_mc.endFill();
	}
	//-------------그리도록 설정-------------------------------------------------
	public function _plAy(_array:Array,base:Number,space:Number,_mc:MovieClip,hi:Number,wd:Number,limit:Number,moVe:Function,color:Number,x_show:Number,y_show:Number):Void {
		this._mc = _mc;
		_mc.createEmptyMovieClip("ball_",this["ball"].getDepth() -1);
		_mc.makeShape(this["ball_"],4,0x000000,5);//그림자 원의 크기와 컬러 투명도 결정
		_mc["ball_"]._visible = false;
		
		_mc.createEmptyMovieClip("signbod",100);
		_mc["signbod"]._visible = false;
		var sign_fmt:TextFormat = new TextFormat();
		sign_fmt.font = "Helvetica";
		sign_fmt.color = 0x444444;
		sign_fmt.size = 12;
		sign_fmt.bold = true;
		sign_fmt.italic = false;
		
		for (var i in _array) {
			
			//if (Number(_array[i]) > 0) {
				if (Number(_array[i]) < 0 || !_array[i] || isNaN(_array[i])) _array[i] = 0;
				_mc["ball"].duplicateMovieClip("dot"+i,100+i);
				_mc["ball_"].duplicateMovieClip("dot_"+i,i);
				_mc["signbod"].attachMovie("sign","sign"+i,i);
				_mc["signbod"]["sign"+i].createTextField("sign",2,0,0,100,50);
				_mc["signbod"]["sign"+i]["sign"].text = _array[i];
				_mc["signbod"]["sign"+i]["sign"].setTextFormat(sign_fmt);
				_mc["signbod"]["sign"+i]["sign"].autoSize = "center";
				_mc["signbod"]["sign"+i]["sign"]._y = -(_mc["signbod"]["sign"+i]._height /2)-(_mc["signbod"]["sign"+i]["sign"]._height /5);
				_mc["signbod"]["sign"+i]["sign"]._x = -(_mc["signbod"]["sign"+i]["sign"]._width /2);
				_mc["signbod"]["sign"+i]._x = base+space*i;
				_mc["signbod"]["sign"+i]._y =-(hi*Number(_array[i])/limit)-5;
				
				if (x_show == 0) { //x축 액션
					_mc["dot"+i]._x = Math.floor(Math.random()*wd);
				} else if (x_show == 1) {
					_mc["dot"+i]._x = base+space*i;
				} else {
					_mc["dot"+i]._x = 0;
				}
				_mc["dot_"+i]._x = _mc["dot"+i]._x + 15;
				
				if (y_show == 0) { //y축 액션
					_mc["dot"+i]._y = -Math.floor(Math.random()*hi);
				} else if (y_show == 1) {
					_mc["dot"+i]._y = -(hi*Number(_array[i])/limit);
				} else {
					_mc["dot"+i]._y = 0;
				}
				_mc["dot_"+i]._y = _mc["dot"+i]._y + 15;
				
				dot_Show(-(hi*Number(_array[i])/limit),base+space*i,_mc["dot"+i],moVe);
				dot_Show(-(hi*Number(_array[i])/limit)+15,base+space*i+15,_mc["dot_"+i],moVe);
			//} else {
				//_mc._parent.chk_ani();
			//}
		}
	}
	//----------------------------------------------------------------------------
	//라인그리기
	public function _Mline(_array:Array,base:Number,space:Number,_mc:MovieClip,hi:Number,wd:Number,limit:Number,color:Number):Void {
		this._mc = _mc;
		//trace("line value : "+_array);
		_mc.createEmptyMovieClip("line_mc",-1);
		_mc.createEmptyMovieClip("line_mc_",-2);
		_mc["line_mc"]._alpha = 0;
		_mc["line_mc_"]._alpha = 0;
		_mc["line_mc"].lineStyle(3,color,80); //선의 스타일
		_mc["line_mc_"].lineStyle(2,0x000000,5); //선의 스타일
		
		var movechk = false;
					
		for (var i=0; i<_array.length; i++) {
			//if (_array[i] > 0) {
				if (Number(_array[i]) < 0 || !_array[i] || isNaN(_array[i])) _array[i] = 0;
				if (!movechk) {
					_mc["line_mc"].moveTo(base+space*i,-(hi*_array[i]/limit));
					_mc["line_mc_"].moveTo(base+space*i+15,-(hi*_array[i]/limit)+15);
					movechk = true;
				} else {
					_mc["line_mc"].lineTo(base+space*i,-(hi*_array[i]/limit));
					_mc["line_mc_"].lineTo(base+space*i+15,-(hi*_array[i]/limit)+15);
				}			
			//}
					_mc["line_mc"].onEnterFrame = function() {
							if (this._alpha <100) {
								this._alpha += 10;
							} else {
								//this._parent["dot2"].play();
								delete this.onEnterFrame;
							}
					}
					_mc["line_mc_"].onEnterFrame = function() {
							if (this._alpha <100) {
								this._alpha += 10;
							} else {
								delete this.onEnterFrame;
							}
					}
		}
	}
	//----------------------------------------------------------------------------
	//점의 이동
	private function dot_Show(Y:Number, X:Number,_mc:MovieClip,mOve:Function):Void {
		var duration = 15;
		//움직임종류
		//Back.(easeIn, easeOut, easeInOut)
		//Bounce. (easeOut,)
		//Elastic. (easeOut, easeInOut)
		//None. (easeNone, easeIn, easeOut, easeInOut)
		//Regular. (easeIn, easeOut, easeInOut)
		//Strong. (easeIn, easeOut, easeInOut)
		//var this.mOve:Function = mx.transitions.easing[mOve[0]][mOve[1]];
		
		var myMove = new lineGraphMove(_mc,mOve,duration);
		myMove.onMotionFinished = function() {
			_mc._parent._parent.chk_ani(); //형식상 옳지못한 방법이나 기능상 꼭 필요.
		}
		myMove.moveTo(X,Y);
	}
	
}
