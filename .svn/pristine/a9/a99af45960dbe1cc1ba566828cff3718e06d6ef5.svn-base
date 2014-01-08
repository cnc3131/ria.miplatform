// -------------지도의 기본 설정들----------------------------------------
Stage.showMenu = false;

var menus:String = "smenu";

var Cresult:String; //loadclip name;
var my_mc:MovieClip = this;
var Map_index:String = "Global"; //Main Map's Location Value..
var _mc:MovieClip; //현제 사용하는 무비체크
var smenuval:String;
/* 로드변수 때문에 뒤로 옮겨질 설정들
_mc = _root.Global;

_root.Global.Show();
_root.Global._alpha = 70;
*/

//-------------------------------------------------------------------
//변수 감시 규칙
var Watcher:Function = function(prop,oldVal,newVal) {
	if (newVal && newVal !="" && newVal != undefined) {
		//trace("1Input newVal = "+newVal);
		my_mc[prop].unWatch(my_mc.menus);
		my_mc.changemenu(newVal);
	//trace("watch action");
		return newVal;
	}
}
//------------------------------------------------------------------
//변수에 대한 감시시작
this[menus] = new Watch(menus,this.Watcher);
//----파일 읽어오기 위한 변환--------------------------------------------------------
var menu_define:Function = function(M:String,mT:String,W:String,wT:String):Void {
	_root.Mailing = M;
	_root.mTarget = mT;
	_root.Warning = W;
	_root.wTarget = wT;
	_root.play();
}
//-----------------------------------------------------------------------

