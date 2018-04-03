package  {
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	public class Fondo extends MovieClip {
	//Variables para el giro de los molinos
	var cont1:int = 0;
	var timer:Timer = new Timer(10, cont1++);
		
		public function Fondo() {
			timer.start();
			timer.addEventListener(TimerEvent.TIMER, tiempo);
		}
		
		//Funcion para que giren los molinos
		function tiempo(e:TimerEvent):void{
			molino1.rotation += 1;
			molino2.rotation -= 1;
			molino3.rotation += 1;
			molino4.rotation -= 1;
		}
	}
}
