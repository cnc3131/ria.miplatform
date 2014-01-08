var PI_index:Object = {}; //인덱스 값을 저장하기

//---------보여주기------------------------------------------------------
var setView:Function = function(A_array:Array) { //값을 받아서 뿌리기
	var temp_array:Array = [];
	for (var i in A_array) { //입력된 값을 배열로 분리
		temp_array[i] = A_array[i].split(",");
	}
	var persent:Array = Compute_persent(temp_array[1]);//백분율계산
	var mathpersent:Array = Compute_round(persent);//0.5단위로 올리고 내림

	//for (var i in temp_array[0]) { //오브젝트에 모든값 담기
		//PI_index[i] = new Object();
		PI_index.index = temp_array[0].concat();
		PI_index.value = temp_array[1].concat();
		PI_index.persent = persent.concat();
		PI_index.paint = mathpersent.concat();
	//}
	this.circle._plAy(this.circle,PI_index,colors);
}
//--------퍼센트 계산-----------------------------------------------------
var Compute_persent:Function = function(_array:Array):Array {
	var sum:Number = 0;
	var _array2 = _array.concat();
	for (var i in _array2) {
		sum += Number(_array2[i]);
	}
	for (var i in _array2) {
		_array2[i] = _array2[i]/sum*100;
		_array2[i] = Math.round(_array2[i]*10) / 10;
	}
	return _array2;
}
//---------퍼센트 반올림-------------------------------------------------------
var Compute_round:Function = function(_array:Array):Array {//0.5단위 반올림
	_array2 = _array.concat();
	for (var i in _array2) {
		_array2[i] = Math.round(_array2[i]*2) / 2;
	}
	return _array2;
}
//------------------------------------------------------------------------
setView(this.Result);
stop();