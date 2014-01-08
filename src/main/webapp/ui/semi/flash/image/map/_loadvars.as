//--------------외부 파일 읽기 함수 일방적으로 읽어오는 것이므로 단순한 load method를 사용--------------
System.useCodepage = true;
sendUrl = "map_define.jsp";
load_lv = new LoadVars();
load_lv.onLoad = function(success:Boolean) {
	if (success) {
		menu_define (this.mailing,this.mTarget,this.warning,this.wTarget);
	} else {
		_root.getURL("Javascript:alert('메뉴를 정의하는 파일이 존재하지 않거나 내용에 문제가 있습니다.');");
	}
}

load_lv.load(sendUrl);




