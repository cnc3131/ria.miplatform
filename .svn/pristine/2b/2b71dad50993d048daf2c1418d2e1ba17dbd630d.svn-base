function Clear_element () { //새로 생성될때 이전 소스들 삭제
	for (var name in this) {
		if ((typeof(this[name]) == "object") && (this[name]._name.indexOf("head") != -1)) this[name].removeTextField(); // 택스트필드 삭제
		if ((typeof(this[name]) == "object") && (this[name]._name.indexOf("ver") != -1)) this[name].removeTextField(); // 택스트필드 삭제
		if ((typeof(this[name]) == "movieclip") && (this[name]._name.indexOf("line") != -1)) this[name].removeMovieClip(); // 선그래프 삭제
		if ((typeof(this[name]) == "movieclip") && (this[name]._name.indexOf("note") != -1)) this[name].removeMovieClip(); // 범례 삭제
		//if ((typeof(this[name]) == "movieclip") && (this[name]._name.indexOf("barset") != -1)) this[name].removeMovieClip(); //막대그래프삭제
		//trace(this[name]._name);
		//trace(typeof(this[name]));
	}
	trace("Clear Start");
}

Clear_element(); // 잔존하는 택스트와 막대를 삭제한다.