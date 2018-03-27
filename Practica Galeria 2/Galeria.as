package{
	import flash.display.Loader;
	import flash.text.TextField;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	import fl.transitions.TweenEvent;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	
	public class Galeria extends Sprite{
		//Variables
		var numeroElementos:uint;
		//var datosXML:XML;
		var galeria:MainGaleria = galeria;
		//var datosXML:MainGaleria;
		var datosXML:XML;
		
		//Invocacion del archivo XML
		public function Galeria() {
			//trace("cargo las imagenes");
			//datosXML = datosXML.MainGaleria;
			//numeroElementos = datosXML.locacion.length();
			setImagenes();
		}
		
		//Funcion donde se ubican las imagenes
		private function setImagenes(){
			trace("posiciono las imagenes");
			
			//Variables temporales
			var posY:uint = 0;
			var posX:uint = 0;
			var cont1:int = 0;
			
			//Imprimirlas en el contenedor
			for(var i:int = 0; i < numeroElementos; i++){
				var ind:Number = (i)%3;
				
				//Obtencion de las coordenadas de las imagenes
				if(i > 0 && ind == 0){
					posY++;
					posX = 0;
				}
				
				//Creacion de las imagenes sobre el sprite
				var imagen:Loader = new Loader();
				imagen.load(new URLRequest(datosXML.locacion[i].imagen));
				addChild(imagen);
				cont1++;
				
				//Generacion e impresion de la informacion de cada imagen
				var texto:TextField = new TextField();
				texto.text = datosXML.locacion[i].info
				texto.y = posY * 245 + 205;
				texto.x = posX * 205;
				addChild(texto);
				
				//Aumento en X
				posX++;
			}
		}
	}
}
