package  {
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
	import flash.display.MovieClip;
	import flash.display.Graphics;
	
	public class MainGaleria extends MovieClip{
		//Declaracion de variables
		public var cargador:URLLoader;
		public var numeroElementos:uint;
		public var galeria:Sprite;
		
		//Variables para cargar los datos del archivo XML
		public var datosXML:XML;
		
		public function MainGaleria() {
			//var ani:Animaciones = new Animaciones();
			entrar_btn.addEventListener(MouseEvent.CLICK, Inicio);
		}
		
		private function Inicio(event:MouseEvent){
			gotoAndStop(2);
			
			//Crear el Sprite
			galeria = new Sprite;
			addChild(galeria);
			
			//Cargar datos del XML
			cargador = new URLLoader(new URLRequest("Galeria.xml"));
			cargador.addEventListener(Event.COMPLETE, CrearSprite);
			volver_btn.addEventListener(MouseEvent.CLICK, Volver);
		}
		
		//Funcion para definir el Sprite
		public function CrearSprite(event:Event){
			galeria.graphics.beginFill(0xBD993F);
			galeria.graphics.drawRect(0, 0, galeria.width, galeria.height);
			galeria.x = 150;
			galeria.y = 25;
			
			//Obtener los datos de las imagenes
			datosXML = new XML(event.target.data);
			
			Galeria();
		}
		
		private function Galeria(){
			numeroElementos = datosXML.locacion.length();
			setImagenes();
		}
		
		//Funcion donde se ubican las imagenes
		private function setImagenes(){
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
				galeria.addChild(imagen);
				cont1++;
				
				//Generacion e impresion de la informacion de cada imagen
				var texto:TextField = new TextField();
				texto.text = datosXML.locacion[i].info
				texto.y = posY * 245 + 205;
				texto.x = posX * 205;
				galeria.addChild(texto);
				
				if(cont1 == 1){
					var MovX:Tween = new Tween(imagen, "x", Regular.easeOut, -100, posX * 205, 5, true);
					var MovY:Tween = new Tween(imagen, "y", Regular.easeOut, -100, posY * 245, 5, true);
				}
				else{
					var MovX2:Tween = new Tween(imagen, "x", Regular.easeOut, -100, posX * 205, 5, true);
					var MovY2:Tween = new Tween(imagen, "y", Regular.easeOut, -100, posY * 245, 5, true);
				}
				
				//Aumento en X
				posX++;
			}
		}
		
		//Funcion para que el sprite quede en el centro
		private function MoverGaleria(event:MouseEvent){
			var porcentaje:Number = mouseX/stage.stageWidth;
			trace(galeria.width);
		}
		
		//Funcion para volver
		private function Volver(event:MouseEvent){
			removeChild(galeria);
			gotoAndStop(1);
			entrar_btn.addEventListener(MouseEvent.CLICK, Inicio);
		}
	}
}
