package  {
	
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class BotonConclusion extends MovieClip{
		var timer:Timer = new Timer(10, contF++);
		var contF:int = 0;
		
		public function BotonConclusion() {
			timer.start();
			timer.addEventListener(TimerEvent.TIMER, tiempo);
		}
		
		//Funcion para que giren los molinos
		function tiempo(e:TimerEvent):void{
			r1.rotation += 1;
		}
	}
}
