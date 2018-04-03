package  {
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	import fl.transitions.TweenEvent;
	import flash.display.MovieClip;
	
	
	public class Wall extends MovieClip {
		//Variables para el giro continuo
		var cont1:int = 0;
		var cont2:int = 0;
		var timer:Timer = new Timer(10, cont1++);
		var timer2:Timer = new Timer(10, cont2++);
		
		//Funcion Inicial
		public function Wall() {
			timer.start();
			timer.addEventListener(TimerEvent.TIMER, Giro);
		}
		
		//Funcion para el giro de abertura
		private function Giro(event:TimerEvent){
			r1.rotation += 1;
			roof1.x -= 3;
			r2.rotation -= 1;
			roof2.x += 3;
			
			//Parar la animacion en la posicion deseada
			if(roof1.x < 45 && roof2.x > 507){
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
			r1.rotation -= 1;
			roof1.x += 3;
			r2.rotation += 1;
			roof2.x -= 3;
			
			//Parar la animacion en la posicion deseada
			if(roof1.x > 370 && roof2.x < 380){
				timer2.stop();
			}
		}
	}
}

