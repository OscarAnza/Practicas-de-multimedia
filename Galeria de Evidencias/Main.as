package  {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.URLLoader;
	import flash.display.Loader;
	import flash.net.navigateToURL;
	import fl.transitions.Tween;
	import fl.transitions.TweenEvent;
	import fl.transitions.easing.*;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.display.Sprite;
	import flash.display.Graphics;
	
	public class Main extends MovieClip{
		//VARIABLES
		var urlDes:URLRequest;
		var urlFile:URLLoader;
		var fondo2:Fondo2;
		var extenderImagen:Sprite;
		var transicion:int = 0;
		var botonCerrar:BotonCerrar = new BotonCerrar();
		var botonCerrar2:BotonCerrar = new BotonCerrar();
		var boton1:BotonEspañol = new BotonEspañol();
		var boton2:BotonIngles = new BotonIngles();
		var frameActual:int = 1;
		var v:simpleFlv = new simpleFlv();
		var mov1:Tween;
		var mov2:Tween;
		
		//Funcion Inicial
		public function Main() {
			Conclusion();
			aro.practicas.addEventListener(MouseEvent.CLICK, Anim1);
			aro.juegos.addEventListener(MouseEvent.CLICK, Anim4);
			aro.mediaa.addEventListener(MouseEvent.CLICK, Anim3);
			aro.tarea.addEventListener(MouseEvent.CLICK, Anim2);
			videos.addEventListener(MouseEvent.CLICK, GoVideos);
			
			extenderImagen = new Sprite();
			extenderImagen.graphics.beginFill(0x005D3D, .75);
			extenderImagen.graphics.drawRect(-500, 50, 500, 300);
			addChild(extenderImagen);
		}
		
		//Ir al frame 2, Practicas
		private function GoPracticas(event:TweenEvent){
			mov2 = new Tween(fondo2, "y", Regular.easeOut, fondo2.x, -400, 2, true);
			gotoAndStop(2);
			frameActual = 2;
			
			fondo.y = 400;
			aro.y = 400;
			pan1.y = 400;
			mov2 = new Tween(aro, "y", Regular.easeOut, aro.y, 0, 2, true);
			mov1 = new Tween(fondo, "y", Regular.easeOut, fondo.y, 0, 2, true);
			mov1 = new Tween(pan1, "y", Regular.easeOut, pan1.y, 51.50, 2, true);
			
			pan1.p1.addEventListener(MouseEvent.MOUSE_UP, P1);
			pan1.p2.addEventListener(MouseEvent.MOUSE_UP, P2);
			pan1.p3_1.addEventListener(MouseEvent.MOUSE_UP, P3_1);
			pan1.p3_2.addEventListener(MouseEvent.MOUSE_UP, P3_2);
			pan1.p4.addEventListener(MouseEvent.MOUSE_UP, P4);
			pan1.p5_1.addEventListener(MouseEvent.MOUSE_UP, P5_1);
			pan1.p5_2.addEventListener(MouseEvent.MOUSE_UP, P5_2);
			pan1.p6.addEventListener(MouseEvent.MOUSE_UP, P6);
			pan1.p8.addEventListener(MouseEvent.MOUSE_UP, P8);
			pan1.p9.addEventListener(MouseEvent.MOUSE_UP, P9);
			pan1.p11.addEventListener(MouseEvent.MOUSE_UP, P11);
			
			if(transicion == 0){
				transicion = 1;
			}
			
			pan1.visible = true;
			mov1.addEventListener(TweenEvent.MOTION_FINISH, BtnConclusion);
		}
		
		//Ir al frame 3, Juegos
		private function GoJuegos(event:TweenEvent){
			mov2 = new Tween(fondo2, "y", Regular.easeOut, fondo2.y, 400, 2, true);
			gotoAndStop(3);
			frameActual = 3;
			
			fondo.y = -400;
			aro.y = -400;
			pan4.y = -400;
			mov2 = new Tween(aro, "y", Regular.easeOut, aro.y, 0, 2, true);
			mov1 = new Tween(fondo, "y", Regular.easeOut, fondo.y, 0, 2, true);
			mov1 = new Tween(pan4, "y", Regular.easeOut, pan4.y, 61.85, 2, true);
			
			pan4.j1.addEventListener(MouseEvent.MOUSE_UP, J1);
			pan4.j2.addEventListener(MouseEvent.MOUSE_UP, J2);
			
			if(transicion == 0){
				transicion = 1;
			}
			
			pan4.visible = true;
			mov1.addEventListener(TweenEvent.MOTION_FINISH, BtnConclusion);
		}
		
		//Ir al frame 4, Multimedia
		private function GoMedia(event:TweenEvent){
			mov2 = new Tween(fondo2, "x", Regular.easeOut, fondo2.x, 550, 2, true);
			gotoAndStop(4);
			frameActual = 4;
			
			fondo.x = -550;
			aro.x = -550;
			pan3.x = -550;
			mov2 = new Tween(aro, "x", Regular.easeOut, aro.x, 75, 2, true);
			mov1 = new Tween(fondo, "x", Regular.easeOut, fondo.x, 0, 2, true);
			mov1 = new Tween(pan3, "x", Regular.easeOut, pan3.x, 173.8, 2, true);
			
			pan3.m1.addEventListener(MouseEvent.MOUSE_UP, M1);
			pan3.m2.addEventListener(MouseEvent.MOUSE_UP, M2);
			pan3.m3.addEventListener(MouseEvent.MOUSE_UP, M3);
			
			if(transicion == 0){
				transicion = 1;
			}
			
			pan3.visible = true;
			mov1.addEventListener(TweenEvent.MOTION_FINISH, BtnConclusion);
		}
		
		//Ir al frmae 5, Tareas
		private function GoTareas(event:TweenEvent){
			mov2 = new Tween(fondo2, "x", Regular.easeOut, fondo2.x, -550, 2, true);
			gotoAndStop(5);
			frameActual = 5;
			
			fondo.x = 550;
			aro.x = 550;
			pan2.x = 550;
			mov2 = new Tween(aro, "x", Regular.easeOut, aro.x, 75, 2, true);
			mov1 = new Tween(fondo, "x", Regular.easeOut, fondo.x, 0, 2, true);
			mov1 = new Tween(pan2, "x", Regular.easeOut, pan2.x, 196.05, 2, true);
			
			pan2.t1.addEventListener(MouseEvent.MOUSE_UP, T1);
			pan2.t2.addEventListener(MouseEvent.MOUSE_UP, T2);
			
			if(transicion == 0){
				transicion = 1;
			}
			
			pan2.visible = true;
			mov1.addEventListener(TweenEvent.MOTION_FINISH, BtnConclusion);
		}
		
		//Ir al frame 6, Videos
		private function GoVideos(event:MouseEvent){
			aro.practicas.removeEventListener(MouseEvent.CLICK, Anim1);
			aro.juegos.removeEventListener(MouseEvent.CLICK, Anim4);
			aro.mediaa.removeEventListener(MouseEvent.CLICK, Anim3);
			aro.tarea.removeEventListener(MouseEvent.CLICK, Anim2);
			videos.removeEventListener(MouseEvent.CLICK, GoVideos);
			
			var movVideo:Tween = new Tween(extenderImagen, "x", Regular.easeOut, extenderImagen.x, 500, 2, true);
			movVideo.addEventListener(TweenEvent.MOTION_FINISH, MostrarContenido);
		}
		
		//F2, PRACTICAS
		private function P1(event:MouseEvent){
			urlDes = new URLRequest("\P1/Practica 1.html");
			navigateToURL(urlDes, "self");
		}
		private function P2(event:MouseEvent){
			urlDes = new URLRequest("\P2/Practica 2.html");
			navigateToURL(urlDes, "self");
		}
		private function P3_1(event:MouseEvent){
			urlDes = new URLRequest("\P3.1/Practica 3.html");
			navigateToURL(urlDes, "self");
		}
		private function P3_2(event:MouseEvent){
			urlDes = new URLRequest("\P3.2/Practica 3. Promedios.html");
			navigateToURL(urlDes, "self");
		}
		private function P4(event:MouseEvent){
			urlDes = new URLRequest("\P4/Practica 4.html");
			navigateToURL(urlDes, "self");
		}
		private function P5_1(event:MouseEvent){
			urlDes = new URLRequest("\P5.1/Practica 5. conversion.html");
			navigateToURL(urlDes, "self");
		}
		private function P5_2(event:MouseEvent){
			urlDes = new URLRequest("\P5.2/Practica 5. Conversion de numeros.html");
			navigateToURL(urlDes, "self");
		}
		private function P6(event:MouseEvent){
			urlDes = new URLRequest("\P6/Practica 6.html");
			navigateToURL(urlDes, "self");
		}
		private function P8(event:MouseEvent){
			urlDes = new URLRequest("\P8/Practica 8.html");
			navigateToURL(urlDes, "self");
		}
		private function P9(event:MouseEvent){
			urlDes = new URLRequest("\P9/Practica 9.html");
			navigateToURL(urlDes, "self");
		}
		private function P11(event:MouseEvent){
			urlDes = new URLRequest("\P11/Practica 11.html");
			navigateToURL(urlDes, "self");
		}
		
		//F3, JUEGOS
		private function J1(event:MouseEvent){
			urlDes = new URLRequest("\Juegos/Juego.html");
			navigateToURL(urlDes, "self");
		}
		private function J2(event:MouseEvent){
			urlDes = new URLRequest("\Juegos/Memorama.html");
			navigateToURL(urlDes, "self");
		}
		private function J3(event:MouseEvent){
			urlDes = new URLRequest("\Juegos/Memorama.html");
			navigateToURL(urlDes, "self");
		}
		
		//F4, MULTIMEDIA
		private function M1(event:MouseEvent){
			urlDes = new URLRequest("\P7/Galeria.swf");
			navigateToURL(urlDes, "self");
		}
		private function M2(event:MouseEvent){
			urlDes = new URLRequest("\P10/GALERIA VIDEO.swf");
			navigateToURL(urlDes, "self");
		}
		private function M3(event:MouseEvent){
			urlDes = new URLRequest("\Practica Galeria 2/Galeria 2.swf");
			navigateToURL(urlDes, "self");
		}
		
		//F5, TAREAS
		private function T1(event:MouseEvent){
			urlDes = new URLRequest("\T1/Tarea 3.html");
			navigateToURL(urlDes, "self");
		}
		private function T2(event:MouseEvent){
			urlDes = new URLRequest("\T2/Tarea 5.html");
			navigateToURL(urlDes, "self");
		}
		
		
		var timer:Timer = new Timer(10, contF++);
		var contF:int = 0;
		
		public function Conclusion(){
			timer.start();
			timer.addEventListener(TimerEvent.TIMER, tiempo);
		}
		
		//Funcion para que giren los molinos
		function tiempo(e:TimerEvent):void{
			r1.rotation += 1;
		}
		
		//ANIMACIONES
		//PRACTICAS
		private function Anim1(event:MouseEvent){
			fondo2 = new Fondo2();
			
			fondo2.x = 0;
			fondo2.y = 400;
			addChild(fondo2);
			mov1 = new Tween(fondo, "y", Regular.easeOut, fondo.y, -400, 2, true);
			mov1 = new Tween(aro, "y", Regular.easeOut, fondo.y, -400, 2, true);
			mov2 = new Tween(fondo2, "y", Regular.easeOut, fondo2.y, 0, 2, true);
			
			mov2.addEventListener(TweenEvent.MOTION_FINISH, GoPracticas);
			
			con.visible = false;
			r1.visible = false;
			videos.visible = false;
			
			switch(frameActual){
				case 2: pan1.visible = false; break;
				case 3: pan4.visible = false; break;
				case 4: pan3.visible = false; break;
				case 5: pan2.visible = false; break;
			}
		}
		//TAREAS
		private function Anim2(event:MouseEvent){
			fondo2 = new Fondo2();
			
			fondo2.x = 550;
			fondo2.y = 0;
			addChild(fondo2);
			mov1 = new Tween(fondo, "x", Regular.easeOut, fondo.x, -550, 2, true);
			mov1 = new Tween(aro, "x", Regular.easeOut, aro.x, -550, 2, true);
			mov2 = new Tween(fondo2, "x", Regular.easeOut, fondo2.x, 0, 2, true);
			
			mov2.addEventListener(TweenEvent.MOTION_FINISH, GoTareas);
			
			con.visible = false;
			r1.visible = false;
			videos.visible = false;
			
			switch(frameActual){
				case 2: pan1.visible = false; break;
				case 3: pan4.visible = false; break;
				case 4: pan3.visible = false; break;
				case 5: pan2.visible = false; break;
			}
		}
		//MEDIA
		private function Anim3(event:MouseEvent){
			fondo2 = new Fondo2;
			
			fondo2.x = -550;
			fondo2.y = 0;
			addChild(fondo2);
			mov1 = new Tween(fondo, "x", Regular.easeOut, fondo.x, 550, 2, true);
			mov1 = new Tween(aro, "x", Regular.easeOut, aro.x, 550, 2, true);
			mov2 = new Tween(fondo2, "x", Regular.easeOut, fondo2.x, 0, 2, true);
			
			mov2.addEventListener(TweenEvent.MOTION_FINISH, GoMedia);
			
			con.visible = false;
			r1.visible = false;
			videos.visible = false;
			
			switch(frameActual){
				case 2: pan1.visible = false; break;
				case 3: pan4.visible = false; break;
				case 4: pan3.visible = false; break;
				case 5: pan2.visible = false; break;
			}
		}
		//JUEGOS
		private function Anim4(event:MouseEvent){
			fondo2 = new Fondo2();
			
			fondo2.x = 0;
			fondo2.y = -400;
			addChild(fondo2);
			mov1 = new Tween(fondo, "y", Regular.easeOut, fondo.y, 400, 2, true);
			mov1 = new Tween(aro, "y", Regular.easeOut, fondo.y, 400, 2, true);
			mov2 = new Tween(fondo2, "y", Regular.easeOut, fondo2.y, 0, 2, true);
			
			mov2.addEventListener(TweenEvent.MOTION_FINISH, GoJuegos);
			
			con.visible = false;
			r1.visible = false;
			videos.visible = false;
			
			switch(frameActual){
				case 2: pan1.visible = false; break;
				case 3: pan4.visible = false; break;
				case 4: pan3.visible = false; break;
				case 5: pan2.visible = false; break;
			}
		}
		//Ocultar boton conclusion
		private function BtnConclusion(event:TweenEvent){
			con.visible = true;
			r1.visible = true;
			videos.visible = true;
		}
		
		//SECCION DE VIDEOS DE CONCLUSION
		//Mostrar los botones de la seccion de videos, sin importar el frame
		private function MostrarContenido(event:TweenEvent){
			botonCerrar.x = 50;
			botonCerrar.y = 100;
			botonCerrar.scaleX = .75;
			botonCerrar.scaleY = .75;
			addChild(botonCerrar);
			
			boton1.x = 150;
			boton1.y = 150;
			addChild(boton1);
			
			boton2.x = 300;
			boton2.y = 150;
			addChild(boton2);
			
			switch(frameActual){
				case 2: pan1.visible = false; break;
				case 3: pan4.visible = false; break;
				case 4: pan3.visible = false; break;
				case 5: pan2.visible = false; break;
			}
			
			botonCerrar.addEventListener(MouseEvent.CLICK, CerrarVideos);
			boton1.addEventListener(MouseEvent.CLICK, Español);
			boton2.addEventListener(MouseEvent.CLICK, Ingles);
		}
		//Funcion que esconde la seccion de videos
		private function CerrarVideos(event:MouseEvent){
			var movVideo2:Tween = new Tween(extenderImagen, "x", Regular.easeOut, extenderImagen.x, -500, 2, true);
			removeChild(botonCerrar);
			removeChild(boton1);
			removeChild(boton2);
			
			aro.practicas.addEventListener(MouseEvent.CLICK, Anim1);
			aro.juegos.addEventListener(MouseEvent.CLICK, Anim4);
			aro.mediaa.addEventListener(MouseEvent.CLICK, Anim3);
			aro.tarea.addEventListener(MouseEvent.CLICK, Anim2);
			videos.addEventListener(MouseEvent.CLICK, GoVideos);
			
			switch(frameActual){
				case 2: pan1.visible = true; break;
				case 3: pan4.visible = true; break;
				case 4: pan3.visible = true; break;
				case 5: pan2.visible = true; break;
			}
		}
		
		var extenderImagen2:Sprite;
		//VIDEOS
		private function Español(event:MouseEvent){
			boton1.visible = false;
			boton2.visible = false;
			botonCerrar.visible = false;
			botonCerrar2 = new BotonCerrar();
			botonCerrar2.x = 50;
			botonCerrar2.y = 100;
			botonCerrar2.scaleX = .75;
			botonCerrar2.scaleY = .75;
			botonCerrar2.addEventListener(MouseEvent.CLICK, CerrarVideo1);
			
			extenderImagen2 = new Sprite();
			extenderImagen2.graphics.beginFill(0x000000, .30);
			extenderImagen2.graphics.drawRect(0, 0, 550, 400);
			addChild(extenderImagen2);
			
			v.playMyFlv("\Conclusiones español/Conclusiones español.mp4");
			v.x = -600;
			v.y = -50;
			extenderImagen.addChild(v);
			addChild(botonCerrar2);
		}
		
		private function Ingles(event:MouseEvent){
			boton1.visible = false;
			boton2.visible = false;
			botonCerrar.visible = false;
			botonCerrar2 = new BotonCerrar();
			botonCerrar2.x = 50;
			botonCerrar2.y = 100;
			botonCerrar2.scaleX = .75;
			botonCerrar2.scaleY = .75;
			botonCerrar2.addEventListener(MouseEvent.CLICK, CerrarVideo2);
			
			extenderImagen2 = new Sprite();
			extenderImagen2.graphics.beginFill(0x000000, .30);
			extenderImagen2.graphics.drawRect(0, 0, 550, 400);
			addChild(extenderImagen2);
			
			v.playMyFlv("\Conclusiones ingles/Conclusiones ingles.mp4");
			v.x = -600;
			v.y = -50;
			extenderImagen.addChild(v);
			addChild(botonCerrar2);
		}
		
		//FUNCION CERRAR VIDEO
		//ESPAÑOL
		private function CerrarVideo1(event:MouseEvent){
			v.closeMyFlv("\Conclusiones ingles/Conclusiones ingles.mp4")
			
			removeChild(extenderImagen2);
			removeChild(botonCerrar2);
			botonCerrar.visible = true;
			boton1.visible = true;
			boton2.visible = true;
		}
		//INGLES
		private function CerrarVideo2(event:MouseEvent){
			v.closeMyFlv("\Conclusiones ingles/Conclusiones ingles.mp4")
			
			removeChild(extenderImagen2);
			removeChild(botonCerrar2);
			botonCerrar.visible = true;
			boton1.visible = true;
			boton2.visible = true;
		}
	}
}