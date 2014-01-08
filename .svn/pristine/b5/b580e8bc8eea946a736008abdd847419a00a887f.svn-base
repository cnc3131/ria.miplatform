function Clear_element () { //새로 생성될때 이전 소스들 삭제
	for (var name in this) {
		if ((typeof(this[name]) == "object") ) this[name].removeTextField(); // 택스트필드 삭제

		//trace(this[name]._name);
		//trace(typeof(this[name]));
	}
}

Clear_element(); // 잔존하는 택스트와 막대를 삭제한다.
weather.gotoAndStop("ready");