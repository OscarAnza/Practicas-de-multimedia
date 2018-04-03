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
	import flash.filters.BitmapFilter;
	import flash.filters.DropShadowFilter;
	import flash.display.DisplayObject;
	import flash.errors.IOError; 
	import flash.events.IOErrorEvent; 
	
	public class MainGaleria extends MovieClip{
		//Declaracion de variables
		//Variables de la galeria
		var cargador:URLLoader;
		var numeroElementos:uint;
		var galeria:Sprite;
		var imagen:Loader;
		var datosXML:XML;
		var posY:uint;
		var posX:uint;
		//Varaibles para aplicar zoom a las imagenes
		var extenderImagen:Sprite;
		var botonCerrar:BotonCerrar = new BotonCerrar();
		var imagenesArray:Array = [];
		var MovZoom:Tween;
		var antX:int;
		var antY:int;
		var imagenClickeada:DisplayObject;
		//Imagen de Error para las imagenes no encontradas
		var imagError:ImagError;
		
		//Portada
		public function MainGaleria() {
			entrar_btn.addEventListener(MouseEvent.CLICK, Inicio);
		}
		
		//Inicio de la galeria
		private function Inicio(event:MouseEvent){
			gotoAndStop(2);
			
			//Crear el Sprite
			galeria = new Sprite;
			addChild(galeria);
			
			//Cargar datos del XML
			cargador = new URLLoader(new URLRequest("Galeria.xml"));
			
			//Iniciar la galeria y el boton para volver a la portada
			cargador.addEventListener(Event.COMPLETE, CrearSprite);
			volver_btn.addEventListener(MouseEvent.CLICK, Volver);
		}
		
		//Funcion para definir el Sprite
		public function CrearSprite(event:Event){
			galeria.graphics.beginFill(0xBD993F);
			galeria.graphics.drawRect(0, 0, galeria.width, galeria.height);
			galeria.x = 50;
			galeria.y = 60;
			
			//Obtener los datos de las imagenes
			datosXML = new XML(event.target.data);
			
			Galeria();
		}
		
		//Cargar los datos de la galeria e iniciar la colocacion de las imagenes
		private function Galeria(){
			numeroElementos = datosXML.locacion.length();
			setImagenes();
		}
		
		//Delay para ocultar la imagen de error
		private function DelayError1(){
			var delay:Timer = new Timer(100, 5);
			delay.start();
			delay.addEventListener(TimerEvent.TIMER_COMPLETE, DelayError2);
		}
		
		//Se hacen visibles todas las imagenes de error colocadas
		private function DelayError2(event:TimerEvent){
			e1.visible = true; e2.visible = true; e3.visible = true; e4.visible = true;
			e5.visible = true; e6.visible = true; e7.visible = true; e8.visible = true;
			e9.visible = true; e10.visible = true; e11.visible = true; e12.visible = true;
			e13.visible = true; e14.visible = true; e15.visible = true; e16.visible = true;
			e17.visible = true; e18.visible = true; e19.visible = true; e20.visible = true;
		}
		
		//Funcion donde se ubican las imagenes
		private function setImagenes(){
			//Limpiar las variables de posicion
			posX = 0;
			posY = 0;
			
			//Delay para desocultar la imagen de error
			DelayError1();
			
			//Imprimirlas en el contenedor
			for(var i:int = 0; i < numeroElementos; i++){
				var ind:Number = (i)%4;
				
				//Obtencion de las coordenadas de las imagenes
				if(i > 0 && ind == 0){
					posY++;
					posX = 0;
				}
				
				//Creacion de las imagenes sobre su sprite
				imagen = new Loader();
				
				imagen.load(new URLRequest(datosXML.locacion[i].imagen));
				//Array para el zoom
				imagenesArray.push(imagen);
				
				//Escalar la imagen y agregarla
				imagen.scaleX = 0.5;
				imagen.scaleY = 0.5;
				galeria.addChild(imagen);
				
				//Posicionamiento de la imagen sobre este
				imagen.x = posX * 170;
				imagen.y = posY * 90;
				
				//Aumento en X
				posX++;
			}
			
			//Detectar clicks sobre las imagenes para expandirlas
			for(var c:int = 0; c < numeroElementos; c++){
				galeria.addChildAt(imagenesArray[c], c).addEventListener(MouseEvent.MOUSE_UP, InicioZoom);
			}
		}
		
		//Bandera para determinar la imagen a ampliar
		private function InicioZoom(event:MouseEvent){
			//Se identifica la imagen clickeada
			imagenClickeada = DisplayObject(event.target);
			
			//Quitar el Listener a la imagen clickeada
			imagenClickeada.removeEventListener(MouseEvent.MOUSE_UP, InicioZoom);
			
			//Se guardan sus coordenadas
			antX = imagenClickeada.x;
			antY = imagenClickeada.y;
			
			AplicarZoom();
		}
		
		//Funcion para expandir las imagenes en un nuevo sprite
		private function AplicarZoom(){
			//Se hacen no visibles las imagenes de error por estetica
			e1.visible = false; e2.visible = false; e3.visible = false; e4.visible = false;
			e5.visible = false; e6.visible = false; e7.visible = false; e8.visible = false;
			e9.visible = false; e10.visible = false; e11.visible = false; e12.visible = false;
			e13.visible = false; e14.visible = false; e15.visible = false; e16.visible = false;
			e17.visible = false; e18.visible = false; e19.visible = false; e20.visible = false;
			
			//Delay para dar tiempo para que el zoom termine antes de permitir que se pueda cerrar
			DelayCerrar();
			
			//Ocultar el boton de volver a la portada durante la pantalla completa
			volver_btn.visible = false;
			
			//Crear Sprite para extender la imagen
			extenderImagen = new Sprite();
			extenderImagen.graphics.beginFill(0x111111, .75);
			extenderImagen.graphics.drawRect(0, 0, 675, 500);
			extenderImagen.x = 47;
			extenderImagen.y = 35;
			//Colocar el nuevo Sprite
			addChild(extenderImagen);
			
			
			//Crear sobre el Sprite el boton para quitar el zoom, se crea de manera no visible
			extenderImagen.addChild(botonCerrar);
			botonCerrar.visible = false;
			botonCerrar.x = 50;
			botonCerrar.y = 50;
			botonCerrar.addEventListener(MouseEvent.CLICK, QuitarZoom);
			
			//Movimientos que acompañan el zoom
			MovZoom = new Tween(imagenClickeada, "x", Strong.easeOut, imagenClickeada.x, 85, 2, true);
			MovZoom = new Tween(imagenClickeada, "y", Strong.easeOut, imagenClickeada.y, 157, 2, true);
			//Escalamiento del tamaño
			MovZoom = new Tween(imagenClickeada, "scaleX", Strong.easeOut, 0.5, 1.5, 0.8, true);
			MovZoom = new Tween(imagenClickeada, "scaleY", Strong.easeOut, 0.5, 1.5, 0.8, true);
			
			//Poner la imagen clickeada
			extenderImagen.addChild(imagenClickeada);
		}
		
		//Funcion para quitar el zoom
		public function QuitarZoom(event:MouseEvent){
			//Desocultar el boton de volver a la portada despues de la pantalla completa
			volver_btn.visible = true;
			
			//Se coloca la imagen sobre su anterior posicion
			imagenClickeada.x = antX;
			imagenClickeada.y = antY;
			
			//Se vuelve a agregar en la galeria
			galeria.addChild(imagenClickeada);
			
			//Se reduce su escala a la de la galeria
			imagenClickeada.scaleX = 0.5;
			imagenClickeada.scaleY = 0.5;
			
			//Se elimina el Sprite del zoom
			removeChild(extenderImagen);
			
			//Detectar clicks sobre las imagenes para expandirlas
			for(var c:int = 0; c < numeroElementos; c++){
				galeria.addChildAt(imagenesArray[c], c).addEventListener(MouseEvent.MOUSE_UP, InicioZoom);
			}
			
			//Se reinician las variables de posicion
			antX = 0;
			antY = 0;
			
			//Se vuelven a hacer invisibles las imagenes de error
			e1.visible = true; e2.visible = true; e3.visible = true; e4.visible = true;
			e5.visible = true; e6.visible = true; e7.visible = true; e8.visible = true;
			e9.visible = true; e10.visible = true; e11.visible = true; e12.visible = true;
			e13.visible = true; e14.visible = true; e15.visible = true; e16.visible = true;
			e17.visible = true; e18.visible = true; e19.visible = true; e20.visible = true;
		}
		
		//Delay para el boton para cerrar el zoom
		private function DelayCerrar(){
			var delay2:Timer = new Timer(1000, 2);
			delay2.start();
			delay2.addEventListener(TimerEvent.TIMER_COMPLETE, MostrarCerrar);
		}
		
		//Mostrar el boton para cerrar el zoom
		private function MostrarCerrar(event:TimerEvent){
			botonCerrar.visible = true;
		}
		
		//Funcion para que el sprite quede en el centro
		private function MoverGaleria(event:MouseEvent){
			var porcentaje:Number = mouseX/stage.stageWidth;
			trace(galeria.width);
		}
		
		//Funcion para volver
		private function Volver(event:MouseEvent){
			removeChild(galeria);
			imagenesArray.splice(0);
			gotoAndStop(1);
			entrar_btn.addEventListener(MouseEvent.CLICK, Inicio);
		}
	}
}