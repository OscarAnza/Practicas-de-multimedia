package{
	import flash.display.MovieClip;
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	import fl.transitions.TweenEvent;
	
	public class Portada extends MovieClip{
	
		public function Portada(){
			//Instancias para llamar los tweens en la portada
			var Poli:Tween = new Tween(poli_mc, "y", Bounce.easeOut, -100, 30, 4, true);
			var Nombre:Tween = new Tween(nombre_mc, "x", None.easeOut, -300, 156, 3, true);
			var Pra:Tween = new Tween(pra_mc, "x", None.easeOut, 550, 216, 3, true);
			var Hm:Tween = new Tween(hm_mc, "x", None.easeOut, -300, 151, 3, true);
			var Siguiente:Tween = new Tween(siguiente_btn, "y", Regular.easeOut, 410, 213, 3, true);
			var Logo:Tween = new Tween(logo_mc, "y", Bounce.easeOut, 500, 135, 3, true);
		}
	}
}
