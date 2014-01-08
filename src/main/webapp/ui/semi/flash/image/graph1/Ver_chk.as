//--------------------------눈금계산 클래스---------------------------------
class Ver_chk {
	function Ver_chk() {}
	
	function Find_space(num:Number):Array {
		var pup = Math.ceil((String(num).length-1));
		pup = Math.pow(10,pup);
		var max = chk_val(num,pup);

		var v_space = max/pup;
		//trace(v_space);
		while (v_space <5 || v_space >8) {
			if (v_space <5 ) { 
				pup = pup/10;
				max = chk_val(num,pup);
				v_space = max/pup;
				//trace(v_space);
			} else if (v_space >8) {
				if (max<20*pup) {
					if (v_space%2) max += pup;
					v_space = Math.ceil(v_space/2);
					//trace(v_space);
				} else {
					max += (5*pup)-(max%(5*pup));
					v_space = max/(pup*5);
					//trace(v_space);
				}
				trace("graphMax:"+max);
			}
		}
		//예외상황

		return [v_space, max];
	}
	
	private function chk_val(num:Number,pup:Number):Number {
		var max = Math.ceil(num/pup)*pup;
		return max;
	}
}