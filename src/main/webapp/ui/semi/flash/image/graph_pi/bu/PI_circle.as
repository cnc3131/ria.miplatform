class PI_circle extends MovieClip {
	//------파이에 관한 클래스---------------------------------------------
	function PI_circle() {
		for(var name in this) {
			if (typeof(this[name]) == "movieclip")  {
				this[name]._visible =false;
			}
		}
		this.useHandCursor = false;
		this.onRollOver = _onRollOver;
		this.onRollOut= _onRollOut;
		this.onDragOut = _onRollOut;
	}
	//---------초기 설정----------------------------------------------
	private var _mc:MovieClip;
	public var _mc2:MovieClip;
	private var paint:Object;
	private var stnum:Number = 0;
	private var interval:Number;
	private var group:Object = {};
	private var _color:Array;
	//--------그리기설정-----------------------------------------------
	public function _plAy(_mc:MovieClip,_obj:Object,color:Array):Void {
		this._mc = _mc;
		this._color = color;
		var st = 0;
		var ed = 0;
		var mname:String;
		var tempx:Number;
		for (var i=0; i<_obj.paint.length; i++) {
			//trace(_obj.value[i]+"/"+_obj.persent[i]);
			group[i]= new Object();
			group[i].movie = new Array();
			group[i].lable = _obj.index[i];
			group[i].point = _obj.value[i];
			group[i].persent = _obj.persent[i];
			group[i].paint = _obj.paint[i];
			group[i].ed = ed;
			ed = (i == _obj.paint.length-1)? 100:st+_obj.paint[i];
			for (var j = st; j<ed; j+=0.5) {
				if (j%1 == 0) {
					Change_color(_mc["c" + j]["q"], color[i][1]);
					mname = "c" + j;
				} else {
					Change_color(_mc["c" +(j-0.5)+"_"]["q"], color[i][1]);
					mname = "c" +(j-0.5)+"_";
				}
				var _mv:MovieClip = _mc[mname];
				group[i].movie.push(mname);
			}
			st += _obj.paint[i];
		}
		_Showstart ();
	}
	//-----------컬러 바꾸기---------------------------------------------
	private function Change_color(_mc:MovieClip, _Color:String):Void {
		//_mcName._parent._visible = true;
		//trace(_mcName._name);
    var oColor = new Color(_mc);
    oColor.setRGB(_Color);
	}
	//---------그리기 명령 인터발 시작-----------------------------------------------
	private function _Showstart():Void {
		_mc.createEmptyMovieClip("board",5000); //그래프에 롤오버 했을때 값을 보여주기 위한 _mc
		_mc.board._visible = false;
		_mc._parent.note._visible = true;
		interval = setInterval(_Show,250,_mc);
	}
	//-----------보여주기 및 텍스트 생성----------------------------------------------
	public function _Show(obj:Object):Void {
		var pi_fmt:TextFormat = new TextFormat();
		pi_fmt.font = "Helvetica";
		pi_fmt.color = 0x000000;
		pi_fmt.bold = true;
		pi_fmt.italic = false;
		//pi_fmt.align = "center";
		var no_fmt:TextFormat = new TextFormat();
		no_fmt.font = "Arial";
		no_fmt.color = 0x000000;
		no_fmt.bold = true;
		no_fmt.italic = false;
		
		//정해진 영역안에 범례를 출사 시켜야 한다.
		var cir_hi:Number = 200/2*0.7; //원의 높이/2  = 반높이 의 70%
		var cir_wd:Number = 300/2*0.7;//원의 넓이/2 = 반넓이 의 70%
		var view_y:Number = -1; //우리가 보는 화면에서는 화면 상단으로 갈수록 - 이다.
		
		var _note = obj._parent.note; //범례_mc;
		
		var i = obj.stnum;
		
		var _group = obj.group[i];
		//범례표시부
		if (_group != undefined) {
			_note.bg.duplicateMovieClip("bg"+i,_note.getNextHighestDepth());
			_note["bg"+i]._y = (_note.bg._height + 1) * (i+1);
			_note.createEmptyMovieClip("rect"+i,_note.getNextHighestDepth());
			_note["rect"+i].beginFill(obj._color[i][0],100);
			_note["rect"+i].lineTo(0,0);
			_note["rect"+i].lineTo(10,0);
			_note["rect"+i].lineTo(10,10);
			_note["rect"+i].lineTo(0,10);
			_note["rect"+i].endFill();
			_note["rect"+i]._x = 6;
			_note["rect"+i]._y = _note["bg"+i]._y+3;
			_note.createTextField("index"+i,_note.getNextHighestDepth(),18,_note["bg"+i]._y-1,100,40);
			_note["index"+i].text = _group.lable;
			_note["index"+i].setTextFormat(no_fmt);
			_note.createTextField("point"+i,_note.getNextHighestDepth(),80,_note["bg"+i]._y-1,100,40);
			_note["point"+i].text = _group.point;
			_note["point"+i].setTextFormat(no_fmt);
			_note["point"+i].autoSize = "left";
			_note["point"+i]._x = 95 - _note["point"+i]._width;
			_note.createTextField("per"+i,_note.getNextHighestDepth(),120,_note["bg"+i]._y-1,100,40);
			_note["per"+i].text = (isNaN(_group.persent))? 0:_group.persent;
			_note["per"+i].setTextFormat(no_fmt);
			_note["per"+i].autoSize = "left";
			_note["per"+i]._x = 145 - _note["per"+i]._width;
		} else {
			var sumPoint:Number = 0;
			var sumPer:Number = 0;
			for (var s=0; s<i; s++) {
				sumPoint += Number(_note["point"+s].text);
				sumPer += Number(_note["per"+s].text);
			}
			if (sumPoint != 0) {
				_note.bg.duplicateMovieClip("bg"+i,_note.getNextHighestDepth());
				_note["bg"+i]._y = (_note.bg._height + 1) * (i+1);
				_note.createTextField("indexT",_note.getNextHighestDepth(),10,_note["bg"+i]._y-1,100,40);
				_note["indexT"].text = "Total";
				no_fmt.color = 0x003366;
				_note["indexT"].setTextFormat(no_fmt);
				_note.createTextField("pointT",_note.getNextHighestDepth(),80,_note["bg"+i]._y-1,100,40);
				_note["pointT"].text = sumPoint;
				_note["pointT"].setTextFormat(no_fmt);
				_note["pointT"].autoSize = "left";
				_note["pointT"]._x = 95 - _note["pointT"]._width;
				_note.createTextField("perT",_note.getNextHighestDepth(),120,_note["bg"+i]._y-1,100,40);
				_note["perT"].text = 100;//sumPer;
				_note["perT"].setTextFormat(no_fmt);
				_note["perT"].autoSize = "left";
				_note["perT"]._x = 145 - _note["perT"]._width;
			} else {
				_note.createTextField("error_",_note.getNextHighestDepth(),250,90,100,40);
				_note.createTextField("error",_note.getNextHighestDepth(),248,88,100,40);
				_note.error.text = _note.error_.text = "Not Found Data";
				no_fmt.size = 28;
				_note.error_.setTextFormat(no_fmt);
				no_fmt.color = 0xFF9900;
				_note.error.setTextFormat(no_fmt);
				_note.error_.autoSize = "left";
				_note.error.autoSize = "left";
			}
		}
		
		if (_group != undefined) {
			if (_group.paint) {
				// 폴리곤 그리기
				obj.emp.duplicateMovieClip("emp"+i,100+i);
				var _poly:MovieClip = obj["emp"+i];
				var poly_st:Number = _group.ed*360/100;
				var st_poly_x:Number = (cir_wd/0.7) * Math.sin(Math.PI/180*poly_st);
				var st_poly_y:Number = (cir_hi/0.7) * Math.cos(Math.PI/180*poly_st) * view_y;
				var poly_ed:Number = _group.paint*360/100 + poly_st;
				var ed_poly_x:Number = (cir_wd/0.7) * Math.sin(Math.PI/180*poly_ed);
				var ed_poly_y:Number = (cir_hi/0.7) * Math.cos(Math.PI/180*poly_ed) * view_y;
				
				_poly.beginFill(obj._color[i][0],100);
				_poly.lineTo(st_poly_x,st_poly_y);
				for (var temr=poly_st; temr<poly_ed; temr++) {
					var txx:Number = (cir_wd/0.7) * Math.sin(Math.PI/180*temr);;
					var tyy:Number = (cir_hi/0.7) * Math.cos(Math.PI/180*temr) * view_y;;
					_poly.lineTo(txx,tyy);
				}
				_poly.lineTo(ed_poly_x,ed_poly_y);
				_poly.lineTo(0,0);
				_poly.endFill();
				
				for (var j in _group.movie) {
					obj[_group.movie[j]]._visible = true;
				}
				//trace("x: "+_group.x+" y: "+_group.y+" w : "+_group.w+" h : "+_group.h);
				obj.createTextField("sign"+i,1000+i,0,0,100,50);
				
				var text_mc:TextField = obj["sign"+i];
				
				text_mc.text = _group.lable;
				pi_fmt.size = 20;
				text_mc.setTextFormat(pi_fmt);
				text_mc.autoSize = "left";
				//trace("누적 "+_group.ed+" 현재 "+_group.paint);
				var place = ((_group.paint*360/100)/2) + (_group.ed*360/100);//값에 따라 각도 설정
				var place_x = cir_wd * Math.sin(Math.PI/180*place);
				var place_y = cir_hi * Math.cos(Math.PI/180*place) * view_y;
				text_mc._x = place_x - (text_mc._width/2);
				text_mc._y = place_y - (text_mc._height/2);
				trace("x :"+text_mc._x+" y :"+text_mc._y);
				
				var temp_x = text_mc._x;
				var temp_y = text_mc._y;
				//예외 케이스
				if (temp_x > 0 && temp_y < 0) { //위치에 따른 수정값 적용
					if (temp_x < 15) { text_mc._y *= 0.8;}
				}
				 else if (temp_x > 0 && temp_y > 0) { //위치에 따른 수정값 적용

				}
				 else if (temp_x < 0 && temp_y > 0) {

				 }
				 else if (temp_x < 0 && temp_y < 0) {
						if (temp_x > -30) { text_mc._y *= 1.2;}
						else if (temp_x > -35) { text_mc._y *= 1.1;}
				 }
				 
				obj.board.createTextField("point"+i,obj.board.getNextHighestDepth(),0,0,100,50);
				var point_mc:TextField = obj.board["point"+i];
				point_mc.text = _group.persent +"%";
				pi_fmt.color = 0xEEEEEE;
				point_mc.setTextFormat(pi_fmt);
				point_mc.autoSize = "left";
				point_mc._x = text_mc._x + text_mc._width;
				point_mc._y = text_mc._y;
			}
			obj.stnum++;
		} else {
			clearInterval(obj.interval);
		}
	}
	//----------------------------------------------------------------------
	function _onRollOver() {
		_mc.board._visible = true;
	}
	//--------------------------------------------------------------------------
	function _onRollOut() {
		_mc.board._visible = false;
	}
}