package  {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class Main extends MovieClip{
		var v:simpleFlv = new simpleFlv();
		//Funcion Inicial
		public function Main(){
			español_btn.addEventListener(MouseEvent.CLICK, VideosEspañol);
			ingles_btn.addEventListener(MouseEvent.CLICK, VideosIngles);
		}
		//Funcion para el F2
		public function VideosEspañol(event:MouseEvent){
			gotoAndStop(2);
			video1_btn.addEventListener(MouseEvent.CLICK, Video1);
			video2_btn.addEventListener(MouseEvent.CLICK, Video2);
			video3_btn.addEventListener(MouseEvent.CLICK, Video3);
			video4_btn.addEventListener(MouseEvent.CLICK, Video4);
			video5_btn.addEventListener(MouseEvent.CLICK, Video5);
			video6_btn.addEventListener(MouseEvent.CLICK, Video6);
			video7_btn.addEventListener(MouseEvent.CLICK, Video7);
			video8_btn.addEventListener(MouseEvent.CLICK, Video8);
			video9_btn.addEventListener(MouseEvent.CLICK, Video9);
			video10_btn.addEventListener(MouseEvent.CLICK, Video10);
		}
		//Funcion para el F3
		public function VideosIngles(event:MouseEvent){
			gotoAndStop(3);
			video11_btn.addEventListener(MouseEvent.CLICK, Video11);
			video12_btn.addEventListener(MouseEvent.CLICK, Video12);
			video13_btn.addEventListener(MouseEvent.CLICK, Video13);
			video14_btn.addEventListener(MouseEvent.CLICK, Video14);
			video15_btn.addEventListener(MouseEvent.CLICK, Video15);
			video16_btn.addEventListener(MouseEvent.CLICK, Video16);
			video17_btn.addEventListener(MouseEvent.CLICK, Video17);
			video18_btn.addEventListener(MouseEvent.CLICK, Video18);
			video19_btn.addEventListener(MouseEvent.CLICK, Video19);
			video20_btn.addEventListener(MouseEvent.CLICK, Video20);
		}
		
		//Funciones para invocar los videos en Español
		public function Video1(event:MouseEvent){
			v.playMyFlv("Video1.mp4");
			addChild(v);
		}
		public function Video2(event:MouseEvent){
			v.playMyFlv("Video2.mp4");
			addChild(v);
		}
		public function Video3(event:MouseEvent){
			v.playMyFlv("Video3.mp4");
			addChild(v);
		}
		public function Video4(event:MouseEvent){
			v.playMyFlv("Video4.mp4");
			addChild(v);
		}
		public function Video5(event:MouseEvent){
			v.playMyFlv("Video5.mp4");
			addChild(v);
		}
		public function Video6(event:MouseEvent){
			v.playMyFlv("Video6.mp4");
			addChild(v);
		}
		public function Video7(event:MouseEvent){
			v.playMyFlv("Video7.mp4");
			addChild(v);
		}
		public function Video8(event:MouseEvent){
			v.playMyFlv("Video8.mp4");
			addChild(v);
		}
		public function Video9(event:MouseEvent){
			v.playMyFlv("Video9.mp4");
			addChild(v);
		}
		public function Video10(event:MouseEvent){
			v.playMyFlv("Video10.mp4");
			addChild(v);
		}
		
		//Funciones para invocar los videos en Ingles
		public function Video11(event:MouseEvent){
			v.playMyFlv("Video11.mp4");
			addChild(v);
		}
		public function Video12(event:MouseEvent){
			v.playMyFlv("Video12.mp4");
			addChild(v);
		}
		public function Video13(event:MouseEvent){
			v.playMyFlv("Video13.mp4");
			addChild(v);
		}
		public function Video14(event:MouseEvent){
			v.playMyFlv("Video14.mp4");
			addChild(v);
		}
		public function Video15(event:MouseEvent){
			v.playMyFlv("Video15.mp4");
			addChild(v);
		}
		public function Video16(event:MouseEvent){
			v.playMyFlv("Video16.mp4");
			addChild(v);
		}
		public function Video17(event:MouseEvent){
			v.playMyFlv("Video17.mp4");
			addChild(v);
		}
		public function Video18(event:MouseEvent){
			v.playMyFlv("Video18.mp4");
			addChild(v);
		}
		public function Video19(event:MouseEvent){
			v.playMyFlv("Video19.mp4");
			addChild(v);
		}
		public function Video20(event:MouseEvent){
			v.playMyFlv("Video20.mp4");
			addChild(v);
		}
	}
}
