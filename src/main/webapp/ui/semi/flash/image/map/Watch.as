//-----------------조중열이 만든 감시자 클래스-----------------------------------------
class Watch {
	function Watch(Val:String,_fun:Function) {
		startWatch(Val,_fun);
	}

	public var temp:Object;
	public var checks:Boolean = false;
	
	public function startWatch(Val:String,_fun:Function) {
		_root.watch(Val,_fun);
	}
	public function unWatch(Val:String) {
		_root.unwatch(Val);
	}
}