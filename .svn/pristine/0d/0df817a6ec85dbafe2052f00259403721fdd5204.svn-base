//메인지도의 액션을 관리하는 스크립
var prev_map_index:String; //이전에 까지의 맵 인댁스값
//-------보여주기----------------------------------------------------------------------------
var setView:Function = function(result:String,small:String) {
	var tmp_mc:MovieClip = mc_set(result);
	if (tmp_mc._name != _mc._name) {
		if (tmp_mc == _root) {
			_mc.Back(tmp_mc);
			_mc = tmp_mc;
		} else if (_mc && _mc._name != "Global") {
			_mc.Back(tmp_mc,small,result);
			_root.Global.Alpha1(70);
		} else if (tmp_mc._name == "Global") {
			_mc.Back(tmp_mc);
			_root.Global.Alpha1(70);
		} else {
			_mc = tmp_mc;
			_mc.Show();
			_mc.Thrust(small,result);
			_root.Global.Alpha2(20);
		}
	} else if (small) {
		setView2(result,small);
	} else if (_mc.state == "solo" && !small) {
		_mc.allVisible_true();
		//_root.getURL("Javascript:flash_act('"+_root.Map_index+"');");
	} else {
		//_root.getURL("Javascript:flash_act('"+_root.Map_index+"');");
	}
	_root.prev_map_index = _root.Map_index;
	//trace(_root.Map_index+"::::"+_mc._name);
}
//----------움직일 지도 설정----------------------------------------------------------------
var mc_set:Function = function(result:String):MovieClip { //입력된 값에 따라 해당 무비클립 선택 및 기본값 선정
	if (result == "NA") { //북미
		name = _root.N_A;
		//if (_root.smenu != "false") { name.XYZ(760,200,200,100); } else { name.XYZ(600,300,200,100); }// x위치,y위치,최종스케일,최종알파
		name.XYZ(600,300,200,100);
	} else if (result == "SA") { //남미
		name = _root.L_A;
		//if (_root.smenu != "false") { name.XYZ(820,250,300,100); } else { name.XYZ(600,300,300,100); }
		name.XYZ(600,300,300,100);
	} else if (result == "EU") { //유럽
		name = _root.EU;
		//if (_root.smenu != "false") { name.XYZ(830,240,340,100); } else { name.XYZ(600,300,340,100); }
		name.XYZ(600,300,340,100);
	} else if (result == "RU") { //소련주변
		name = _root.RU;
		//if (_root.smenu != "false") { name.XYZ(730,160,150,100); } else { name.XYZ(600,300,150,100); }
		name.XYZ(600,300,150,100);
	} else if (result == "CH") { //중국
		name = _root.CHI;
		//if (_root.smenu != "false") { name.XYZ(770,170,320,100); } else { name.XYZ(600,300,320,100); }
		name.XYZ(600,300,320,100);
	} else if (result == "WA") { //서아시아
		name = _root.SW_A;
		//if (_root.smenu != "false") { name.XYZ(830,200,500,100); } else { name.XYZ(600,300,500,100); }
		name.XYZ(600,300,500,100);
	} else if (result == "EA") { //동아시아
		name = _root.SE_A;
		//if (_root.smenu != "false") { name.XYZ(820,220,280,100); } else { name.XYZ(600,300,280,100); }
		name.XYZ(600,300,280,100);
	} else if (result == "MA") { //중동 아프리카
		name = _root.ME_AA;
		//if (_root.smenu != "false") { name.XYZ(800,220,230,100); } else { name.XYZ(600,300,230,100); }
		name.XYZ(600,300,230,100);
	} else if (result == "Global") { //전체보기
		name = _root.Global;		
	}
	_root.Global.XYZ(500,400,80,20);
	return name;
}
//------------검색----------------------------------------------------------------------
function find(_array:Array,element):Number { //배열검색용 함수
	for (var i=0; i<_array.length; i++) {
		if (_array[i] == element) {
			return i;
		}
	}
	return ;//-1,0 의 숫자를 출력한다면 배열이 삭제 된다.
}
//-----------삭제------------------------------------------------------------------------
function deleteElement(_array:Array,index:Number) { //배열 삭제용 함수
	_array.splice(index,1);
}
//-------법인 동작---------------------------------------------------------------
var setView2:Function = function(mam:String,result:String) {
	var esc = result.split(",");
	var escname = esc.concat(); //예비 카피
	trace("변수값 "+escname+" 길이 "+esc.length);
	//현재 열린 지도가 있는지 그리고 지도에 들어갈 법인인지 체크
	if (_mc && esc) {
		for (var name in _mc) { //들어온 값중 첫번째와 현재 무비의 구성 요소 비교
			if (typeof(_mc[name]) == "movieclip" && _mc[name]._name == esc[0]) {
				for (var name in _mc) {
					if (typeof(_mc[name]) == "movieclip" && _mc != _mc[name] && _mc[name]._name != "shadows") { //무비클립일때만 검사
						
							var esc_find = (esc.length)? find(esc,_mc[name]._name):undefined; //검색
							
							if (esc_find != undefined) { //목록에 들어있는 법인 일때
								if (_mc[name]._visible && _mc.state == "solo") { //현재 visible 상태 체크
									//trace(_mc[name]+" 는 이미 보여지고 있습니다.");
								} else {
									//trace(_mc[name]+" 는 보이게 할께요 주인님");
									_mc.View_esc(_mc[name],mam);
									_mc.state = "solo";
								}
								deleteElement(esc,esc_find); 
							} else { //목록에 없는 무비일때
								if (_mc[name]._visible) { //현재 visible 상태 체크
									//trace(_mc[name]+"는 처리 하겠습니다.");
									_mc.unView_esc(_mc[name]);
								} else {
									//trace(_mc[name]+"는 신경쓰지마세요.");
								}
							}
							
					}
				}
				break;
			}
		}
	}
}
//---------외부에서 베스트 워스트 통제를 위한 함수---------------------------------------------------------
var changemenu:Function = function(result:String) {
	//trace("이전기억값 : "+this.smenuval+"   현재값 : "+result);
	if (this.smenuval != result) {
		if (result == "false") {
			//trace("false value ok");
			_root.menu3.gotoAndPlay("hide");
		} else if (result == "GLOBAL") {
			_root.Smap.gotoAndPlay("GB");
			_root.Mmenu.L_Bar.gotoAndStop("GB");
			if(_root.Map_index != "Global") {
				_root.Map_index = "Global";
			}
			if (_mc._name != "Global") _mc.Back(_parent.Global);
			Global.Alpha1_(70);
		} else if (result == "WARNING") {
			_root.Smap.gotoAndPlay("WAR");
			if (this.smenuval != "false") 	_root.Mmenu.L_Bar.gotoAndStop("WAR1");
			if(_root.Map_index != "Global") {
				_root.Map_index = "Global";
			}
			if (_mc._name != "Global") _mc.Back(_parent.Global);
			Global.Alpha1_(70);
		}
		
		if (this.smenuval == "false") {
			//trace("false value off");
			_root.menu3.gotoAndPlay("view");
		}
		this.smenuval = result;
	}
	
	//감시다시 시작
	//trace("What crazy hand "+menus);
	this[menus].startWatch(this.menus,this.Watcher);
}
//------------실행 명령----------------------------------------------------------------
var TransCode:Function = function(big:String,small:String):Void {
	setView(big,small);
}
//_root.smenu = "false";