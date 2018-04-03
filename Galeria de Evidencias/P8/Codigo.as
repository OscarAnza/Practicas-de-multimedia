package  {
	import flash.display.MovieClip;
	
	public class Codigo extends MovieClip{
		//Se crean dos variables para almacenar las areas
		private var areaCirculo:Number;
		private var areaTriangulo:Number;
	
		public function AreaCirculo(val:Number){
			//Se recibe un dato por parametro y despues se multiplica por pi para calcular el area
			var radio:Number = val;
			areaCirculo = 3.1416 * (radio * radio);
		}
		
		public function Circulo():String{
			return areaCirculo.toString();
		}
		
		public function AreaTriangulo(val1:Number, val2:Number){
			//Se recibe dos datos por parametros y despues se multiplican para calcular el area
			var base:Number = val1;
			var altura:Number = val2;
			areaTriangulo = (base * altura)/2
		}
		
		public function Triangulo():String{
			return areaTriangulo.toString();
		}
	}
}
