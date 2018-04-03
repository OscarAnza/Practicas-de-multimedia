package  {
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	import fl.transitions.TweenEvent;
	
	public class Main extends MovieClip{
		//Variables
		var numero:Array = [];
		var numeroDiv:Array = [0, 0, 0, 0];
		var suma1:int;
		var suma2:int;
		var prom:Number;
		
		public function Main() {
			//Movimeinto en X
			var Mov1x:Tween = new Tween(linea1, "x", Strong.easeOut, 0, (41.35), 6, true);
			var Mov2x:Tween = new Tween(linea2, "x", Strong.easeOut, -50, (68.35), 6, true);
			var Mov3x:Tween = new Tween(linea3, "x", Strong.easeOut, -35, (50.95), 6, true);
			var Mov4x:Tween = new Tween(linea4, "x", Strong.easeOut, 250, (213.9), 6, true);
			//Movimiento en Y
			var Mov1y:Tween = new Tween(linea1, "y", Elastic.easeOut, -100, (37.10), 4, true);
			var Mov2y:Tween = new Tween(linea2, "y", Elastic.easeOut, 20, (110.5), 4, true);
			var Mov3y:Tween = new Tween(linea3, "y", Elastic.easeOut, 200, (179.50), 4, true);
			var Mov4y:Tween = new Tween(linea4, "y", Elastic.easeOut, 440, (236.1), 4, true);
			
			inicio_btn.addEventListener(MouseEvent.CLICK, Sig);
		}
		
		public function Sig(event:MouseEvent){
			gotoAndStop(2);
			save_btn.addEventListener(MouseEvent.CLICK, Save);
			return1_btn.addEventListener(MouseEvent.CLICK, Return1);
		}
		
		//Funcion para regresar a la portada
		public function Return1(event:MouseEvent):void{
			gotoAndStop(1);
			numero.splice(0);
			numeroDiv.splice(0);
			//Cargar los listeners de la portada
			inicio_btn.addEventListener(MouseEvent.CLICK, Sig);
		}
		
		public function Save(event:MouseEvent){
			//Validar que se ingreso un dato
			if(num.length < 1){
				alert.text = "Ingresa un numero";
			}
			else{
				//Recoger el dato
				numero.push(Number(num.text));
				for(var a:int = 0; a < numero.length; a++){
					//Validar que es un numero
					if(isNaN(numero[a])){
						alert.text = "Ingresa un numero";
					}
					else{
						//Se verifica que se ingresaron los 4 numeros
						if(numero.length > 3){
							ComparacionParImpar();
						}
					}
				}
			}
		}
		
		public function ComparacionParImpar(){
			for(var b:int = 0; b < numero.length; b++){
				//Se divide el numero entre 2 y se guarda su residuo
				trace(numeroDiv[b]);
				numeroDiv[b] = numero[b] % 2;
				//Compara si todos los numeros son par
				if(numeroDiv[0] == 0 && numeroDiv[1] == 0 && numeroDiv[2] == 0 && numeroDiv[3] == 0){
					Suma();
				}
				//Indica que un nuemero es impar
				else{
					Promedio();
				}
			}
		}
		
		//Sumar los 4 numeros
		public function Suma(){
			//Solo se suman los 4 numeros
			trace(numero[0] + numero[1] + numero[2] + numero[3])
			suma1 = numero[0]  + numero[1] + numero[2] + numero[3];
			res.text = suma1.toString();
			
			//Reinicia arrays
			numero.splice(0);
			numeroDiv.splice(0);
		}
		
		//Obtener promedio de los 4 numeros
		public function Promedio(){
			//Se suman los 4 numeros y se otiene promedio
			suma2 = numero[0] + numero[1] + numero[2] + numero[3];
			prom = suma2 / 4;
			
			res.text = prom.toString();
			
			//Reinicia arrays
			numero.splice(0);
			numeroDiv.splice(0);
		}
	}
}