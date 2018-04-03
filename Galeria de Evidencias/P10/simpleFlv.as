﻿package  {
	import flash.display.Sprite;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.media.Video;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextField;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.events.NetStatusEvent;
	import flash.utils.Timer;
	
	public class simpleFlv extends Sprite {
		private var _video:Video;
		private var _stream:NetStream;
		private var _playbackTime:TextField;
		private var _duration:uint;
		private var _timer:Timer;
		
		public function simpleFlv() {
			_duration = 0;
			
			_playbackTime = new TextField();
			_playbackTime.autoSize = TextFieldAutoSize.LEFT;
			_playbackTime.y = 20;
			_playbackTime.x = 20;
			_playbackTime.text = "Bufering...";
			
			_timer = new Timer(1000);
			_timer.addEventListener(TimerEvent.TIMER,onTimer);
			_timer.start();
		}
		
		public function playMyFlv(mp4Url){
			_video = new Video();
			
			var connection:NetConnection = new NetConnection();
			connection.connect(null);
			
			_stream = new NetStream(connection);
			_stream.play(mp4Url);
			
			var Client:Object = new Object();
			Client.onMetaData = onMetaData;
			_stream.client = Client;
			_video.attachNetStream(_stream);
			
			_stream.addEventListener(NetStatusEvent.NET_STATUS,onNetStatus);
			
			addChild(_video);
			addChild(_playbackTime);
		}
		
		private function onMetaData(data:Object){
			_duration = data.duration;
		}
		
		private function onNetStatus(e:NetStatusEvent){
			_video.width = 700;
			_video.height = 500;
		}
		
		private function onTimer(t:TimerEvent){
			if(_duration > 0 && _stream.time > 0){
				_playbackTime.text = Math.round(_stream.time) + " / " + Math.round(_duration);
			}
		}
		
	}
	
}
