//---------------------초기함수 설정--------------------------------------------
	var aniTime:Number = 0;
	var num_graph1:Number = 0; //선그래프개수
	var Length:Number = 0; //x축 개수
	var Rs_array:Array; //그래프 값을 담을 배열
	var BasePosition:Number; //점들의 처음  x축 위치
	var Space:Number; //점들의 x축 간격
	var Top_1st:Number; //왼y축 그래프의 최고 높이
	var Note:Array = [];//범례
	var Head:Array = [];//x축
	var Line:Array = [];//선그래프
	var Left_m:String; //눈금의 단위
//---------------보여주기---------------------------------------
var setView:Function = function(A_array:Array,B_array:Array) { //A_array-인덱스,범례:B_array-line그래프값  값을 받아서 뿌리기
 // trace("setView Start");
 	Note = A_array[0].split(","); //범례를 분리 한다.
	Head = A_array[1].split(","); //x축 인덱스분리
	if(A_array[2]) Left_m = A_array[2];
	
	var Point:Array = []; //바그래프값 2차분리를 위한배열
	
	for (var i=0; i<note_len; i++) {
		Point[i] = B_array[i].split(","); //각 라인별 값을 배열로 저장
		//trace(i+"="+Point[i]);
	}
  
	setPosition(Note,Head,Point);
}
//------------레이블 표시----------------------------------------------------
function Show_label(_array:Array,SetP:Number,space:Number):Void { //레이블 붙이기
	for (var i=0; i<_array.length; i++) {
		this.createTextField("head"+i,1200+i,space*i,8,100,25);
		this.createTextField("head_"+i,1100+i,space*i,7,100,25);
		this["head"+i].text = _array[i];
		this["head_"+i].text = _array[i];
		this["head"+i].autoSize = "center";
		this["head_"+i].autoSize = "center";
		my_fmt.color = 0x222222;
		my_fmt.size = 14;
		my_fmt.align = "center";
		my_fmt.bold = true;
		this["head"+i].setTextFormat(my_fmt);
		my_fmt.color = 0xEEEEEE;
		this["head_"+i].setTextFormat(my_fmt);
		this["head"+i]._x = space*i+SetP-(this["head"+i]._width/2);
		this["head"+i].selectable = false;
		this["head_"+i]._x = space*i+1+SetP-(this["head_"+i]._width/2);
		this["head_"+i].selectable = false;
	}
}
//---------범례표시-------------------------------------------------------
function Show_nOte(_array:Array):Void { //범례붙이기
	var space = Math.floor(_root._width/(_array.length+1))/1.1;
	this.createEmptyMovieClip("notes",400); //전체 범례가 들어갈 무비
	this.notes._x = 0;
	this.notes._y = 40;
	
	for (var i in _array) {
		this.notes.createEmptyMovieClip("note"+i,200+i);
		this.notes["note"+i].createEmptyMovieClip("line",2); //line
		with(this.notes["note"+i].line) {
			var x = space*i;
			var y = 9;
			lineStyle(3,this.index_color[i],60);
			moveTo(x,y);
			lineTo(x+15,y);
		}
		this.notes["note"+i].attachMovie("point","circle",3); //circle
		with(this.notes["note"+i].circle) {
			var _r:Number = 4;
			var sqrt2:Number = Math.SQRT2;
			var c = _r*(sqrt2-1);
			var m = _r*sqrt2*.5;
			var x = 0;
			var y = 0;
			beginFill(this.index_color[i],100);
			moveTo(x+_r,y);
			curveTo(x+_r,y+c,x+m,y+m);
			curveTo(x+c,y+_r,x,y+_r);
			curveTo(x-c,y+_r,x-m,y+m);
			curveTo(x-_r,y+c,x-_r,y);
			curveTo(x-_r,y-c,x-m,y-m);
			curveTo(x-c,y-_r,x,y-_r);
			curveTo(x+c,y-_r,x+m,y-m);
			curveTo(x+_r,y-c,x+_r,y);
			endFill();
			_x = (space*i)+(_parent.line._width/2)-(_r/2);
			_y = 9;
		}		
		this.notes["note"+i].createTextField("index",1,(space*i)+(this.notes["note"+i].line._width/1.2),-2,80,25);
		this.notes["note"+i].index.text = _array[i];
		my_fmt.size = 14;
		my_fmt.color = 0x000033;
		my_fmt.align = "left";
		my_fmt.bold = true;
		this.notes["note"+i].index.setTextFormat(my_fmt);
		this.notes["note"+i].index.autoSize = "left";
	}
	this.notes.attachMovie("notebg","bg",1);
	this.notes._x = (Stage.width/2)-(this.notes._width/2)-this._x;
	this.notes.bg._x = -20;
	this.notes.bg._width = this.notes._width + 20;
	this.notes.bg._alpha = 80;

}
//---------좌측 눈금------------------------------------------------------
function Show_Ver_left(num:Number):Number { //수직 값붙이기
	var ver_chk = new Ver_chk();
	var _array = ver_chk.Find_space(num);
	var v_space = _array[0];
	var limit = _array[1];
	var cut_num = limit/v_space;
	var limit2 = limit;
	for (var i=0; i<v_space; i++) {
		this.createTextField("verL"+i,150+i,-135,-(Height-(Height/v_space*i)+7)+32,100,30);
		this.not2.duplicateMovieClip("not2"+i,140+i);
		this["not2"+i]._y = -(Height-(Height/v_space*i)+9)+(this["not2"+i]._height/2+16);
		this["not2"+i]._visible = true;
		this.not1.duplicateMovieClip("not1"+i,240+i);
		this["not1"+i]._y = -(Height-(Height/v_space*i)+9)-5;
		this["not1"+i]._visible = true;
		this["verL"+i].text = limit2;
		this["verL"+i].selectable = false;
		my_fmt.color = 0x003344;
		my_fmt.size = 14;
		my_fmt.align = "right";
		my_fmt.bold = true;
		this["verL"+i].setTextFormat(my_fmt);
		limit2 -= cut_num;
	}
	if (Left_m) {
		this.createTextField("verLF",170,-135,-(235),100,35);
		this["verLF"].text = Left_m;
		this["verLF"].selectable = false;
		my_fmt.bold = true;
		this["verLF"].setTextFormat(my_fmt);
	}
	return limit;
}
//----------배열 값들을 숫자로 변환-------------------------------------------------------
function Trans_num(_array:Array,total:Number):Array {
	for (var i in _array) { //소트를 위한 숫자값으로 변환
		if (total >1) {
			for (var j in _array[i]) {
				_array[i][j] = (isNaN(Number(_array[i][j])))? "":Number(_array[i][j]);
			}
		} else {
			for (var j=0; j< _array[i].length; j++) {
				_array[i][j] =(isNaN(Number(_array[i][j])))? "":Number(_array[i][j]);
			}
		}
	}
	return _array;
}
//-------------가장 큰수 9하기----------------------------------------------------
function Top_num(_array:Array,total:Number):Number {	
	var Top1 = [];
	if (total > 1) {
		for (var i in _array) {
			Top1[i] = ((_array[i].concat()).sort(16)).pop();
		}
	} else {
		Top1=_array[0].concat();
	}
	var Top2 = (Top1.sort(16)).pop();
		trace("Max:" + Top2);	
	return Top2;

}
//----------무빙종류-------------------------------------------------------
function Select_moving(rnd:Number):Function {//움직임 종류선택
	trace("Moving : "+Moving[rnd]); //움직임
	var coDe = Moving[rnd].split("."); //평션으로 만들수 있도록 분리	
	var Func:Function;
	if (coDe[0] == "Back") {
		Func = mx.transitions.easing.Back[coDe[1]];
	} else if (coDe[0] == "Bounce") {
		Func = mx.transitions.easing.Bounce[coDe[1]];
	} else if (coDe[0] == "Elastic") {
		Func = mx.transitions.easing.Elastic[coDe[1]];
	} else if (coDe[0] == "None") {
		Func = mx.transitions.easing.None[coDe[1]];
	} else if (coDe[0] == "Regular") {
		Func = mx.transitions.easing.Regular[coDe[1]];
	} else if (coDe[0] == "Strong") {
		Func = mx.transitions.easing.Strong[coDe[1]];
	} 
	return Func;
}
//------------선그리기------------------------------------------------
function Paint_line(mAke:Number,_array:Array,SetP:Number,space:Number,limit:Number):Void { //선 그리기
	var cOde:Function = Select_moving(Math.floor(Math.random()*Moving.length));//움직임 종류선택 호출
	//움직임 종류선택
	var x_show:Number = Math.floor(Math.random()*3);
	var y_show:Number = Math.floor(Math.random()*3);
	for (var i=0; i<mAke; i++) {
		this.line.duplicateMovieClip("line"+i,2050+i);
		this["line"+i]._alpha = 10;
		if (mAke > 1) {
			this["line"+i]._plAy(_array[i],SetP,space,this["line"+i],Height,Width,limit,cOde,index_color[i],x_show,y_show);
		} else {
			this["line"+i]._plAy(_array[i],SetP,space,this["line"+i],Height,Width,limit,cOde,index_color[i],x_show,y_show);
		}
		trace("makeMovie");
		this["line"+i].onEnterFrame = function() {
			if (this._alpha <100) {
				this._alpha += 10;
			} else {
				delete this.onEnterFrame;
			}
		}
	}
}
//------------배열의 길이는---------------------------------------------------
function Num_Array(_array:Array):Number { //배열개수파악
var chk = 0;
	for (var i=0; i<_array.length; i++) {
		if (typeof(_array[i]) == "object") {
			chk = _array[i].length;;
		} else {
			chk = 1;
		}
	}
	trace("chk :"+chk);
	return chk;
}
//-----------그리기 명령 순차적으로 실행-----------------------------------------------
function setPosition(A_array:Array,B_array:Array,C_array:Array):Void { //A:범례,B:x축,C:바그래프값 택스트와 바 위치 및 크기 잡기
	
	num_graph1 = A_array.length; //바그래프개수파악
	trace("Position Start Graph num : "+num_graph1);
	Length = B_array.length; //x 축 개수
	Space = Math.floor(Width / Length) //막대간 거리파악
	BasePosition = Math.floor(Space/2); //표의 위치

	Show_label(B_array,BasePosition,Space); //x축 값표시
	
	//왼쪽 수치및 막대그래프
	C_array = Trans_num(C_array,num_graph1);
	Line = C_array;
	var Top1 = Top_num(C_array,num_graph1);//바그래프최고값
	Top_1st = Show_Ver_left(Top1);//왼쪽 y축 값표시
	Paint_line(num_graph1,C_array,BasePosition,Space,Top_1st); //표그리기
}
//----------막대 그리기 체크----------------------------------------------------------
function chk_barani() { //막대운동이 끝난후 선그래프시작을 위한 평션
	barTime++;
	if (barTime >= Length) {
		Show_nOte(); //범례만들기
		barTime = 0;
	}
}
//------------점 그리기 체크------------------------------------------------------
function chk_ani() {
	aniTime++;
	//trace("aniTime : "+aniTime);
	if (aniTime >= num_graph1*Length ) {
		for (var i=0; i<num_graph1; i++) {
			if (num_graph1 > 1) {
				this["line"+i]._Mline(Line[i],BasePosition,Space,this["line"+i],Height,Width,Top_1st,index_color[i]);
			} else {
				this["line"+i]._Mline(Line[i],BasePosition,Space,this["line"+i],Height,Width,Top_1st,index_color[i]);
			}
		}
		aniTime = 0;
		Show_nOte(Note); //범례만들기
	}
}
//------------------------------------------------------------------------------
setView(this.Result,this.Value_ID);
stop();