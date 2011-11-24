﻿package com.tribalframework.motionCam{	import flash.display.Sprite;	import flash.display.StageAlign	import flash.display.StageScaleMode	import flash.display.BitmapData	import flash.display.Bitmap	import flash.utils.setInterval	import flash.text.TextField	import flash.media.Camera	import flash.media.Video	import flash.geom.Point	import flash.geom.Rectangle	import flash.events.*;		import flash.external.ExternalInterface;		public class MotionCam extends Sprite{		private var cam		:Camera;		private var video	:Video;		private var now		:BitmapData;		private var out		:BitmapData;		private var out2	:BitmapData;		private var diff	:BitmapData;		private var prev	:BitmapData;		private var label	:TextField;		private var myInt	:Number;		private var camFPS	:Number 	= 15;		private var camW	:Number 	= 300;	// 250		private var camH	:Number 	= 227;	// 190				private var upper	:Number		= 5000;		private var lower	:Number		= 500;	// Sensitivity of detection (lower more sensitive)				private var count = 0;		public function MotionCam (){									}				/* start Render of Video		**************************/		public function initVideo(obj:Object){			resetSmallObj();			cam = Camera.getCamera();			cam.setMode(camW, camH, camFPS);			if (cam == null) {				label = new TextField();				label.text = "NO WEBCAM";				addChild(label);			} else {				video = new Video(cam.width, cam.height);				video.attachCamera(cam);				obj.addChild(video);				now = new BitmapData(video.width, video.height);				out = new BitmapData(video.width, video.height);				diff = new BitmapData(video.width, video.height);				prev = new BitmapData(video.width, video.height);				out2 = out;			//	out2.visible = false;								var previous = addChild(new Bitmap(prev));				previous.x = video.width;				previous.visible = false;	// sean edit				var diffBitmap = addChild(new Bitmap(diff));				diffBitmap.y = video.height;				diffBitmap.visible = false;	// sean edit								var output = addChild(new Bitmap(out));				output.x = video.width;				output.y = video.height;				output.visible = false;		// sean edit							}		}				public function displayVideo(){		//	out2.visible = true;			myInt = setInterval(render, 2000/camFPS);		}				private function render ():void {					if (!cam.currentFPS) return;						now.draw(video);			diff.draw(video);			diff.draw(prev,null,null,"difference");		//	out.fillRect(new Rectangle(0,0,out.width,out.height),0xFF000000);		//	out.threshold(diff, new Rectangle(0,0,diff.width,diff.height), new Point(0,0), ">", 0xFF333333, 0xFFFF0000);			out.threshold(diff, new Rectangle(0,0,50,220), new Point(0,0), ">", 0xFF333333, 0xFFFF0000);			out2.threshold(diff, new Rectangle(240,0,50,220), new Point(0,0), ">", 0xFF333333, 0xFFFF0000);			prev.draw(video);						var myVal = out.threshold(diff, new Rectangle(0,0,50,220), new Point(0,0), ">", 0xFF333333, 0xFFFF0000);			var myVal2 = out2.threshold(diff, new Rectangle(240,0,50,220), new Point(0,0), ">", 0xFF333333, 0xFFFF0000);						trace(myVal, myVal2);						if(myVal > lower && myVal < upper){				count++;				if(count == 1){					trace('OKOK_RIGHT');					cta();				}			}			if(myVal2 > lower && myVal2 < upper){				count++;				if(count == 1){					trace('OKOK_LEFT');					cta();				}			}		}				private function stopVideo(){		//	clearInterval(myInt);		}				private function cta(){		//	text_txt.text = "OKOK";		//	btn.visible = true;			dispatchEvent(new Event("DONE"));								//	stopVideo();		}						private function resetSmallObj(){			count = 0;		//	clearInterval(myInt);		//	text_txt.text = "";		//	btn.visible = false;		}			}}