package  {
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	import fl.transitions.TweenEvent;
	
	public class Animaciones extends MovieClip{
		//Variables para el giro continuo
		var cont1:int = 0;
		var cont2:int = 0;
		var timer:Timer = new Timer(10, cont1++);
		var timer2:Timer = new Timer(10, cont2++);
		
		//Funcion Inicial
		public function Animaciones() {
			timer.start();
			timer.addEventListener(TimerEvent.TIMER, Giro);
		}
		
		//Funcion para el giro de abertura
		private function Giro(event:TimerEvent){
			wall.r1.rotation += 1;
			wall.roof1.x -= 3;
			wall.r2.rotation -= 1;
			wall.roof2.x += 3;
			
			//Parar la animacion en la posicion deseada
			if(wall.roof1.x < 45 && wall.roof2.x > 503){
				timer.stop();
				Delay()
			}
		}
		
		//Delay para reiniciar la animacion
		private function Delay(){
			var delay:Timer = new Timer(1000, 1);
			delay.start();
			delay.addEventListener(TimerEvent.TIMER_COMPLETE, InicioGiro2);
		}
		
		//Inicio del cierre
		private function InicioGiro2(event:TimerEvent){
			timer2.start();
			timer2.addEventListener(TimerEvent.TIMER, Giro2);
		}
		
		//Funcion para el giro de cierre
		private function Giro2(event:TimerEvent){
			wall.r1.rotation -= 1;
			wall.roof1.x += 3;
			wall.r2.rotation += 1;
			wall.roof2.x -= 3;
			
			//Parar la animacion en la posicion deseada
			if(wall.roof1.x > 419 && wall.roof2.x < 431){
				timer2.stop();
			}
		}
	}
}
