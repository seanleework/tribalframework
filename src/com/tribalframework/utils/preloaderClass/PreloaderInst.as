﻿/*** ** Simple Preloader** com.tribalframework.utils.preloaderClass.Preloader** @ver 1.0** @date 23-06-2010***************************************/package com.tribalframework.utils.preloaderClass{	import flash.display.*;	import flash.events.*;	import flash.net.*;	import flash.text.TextField;		public class PreloaderInst	{		public var loader:Loader;		private var i:Number;		private var loadValue:Number = 0;		private var maxValue:Number = 0;				private var _stg:Object;		private var _text:TextField;		private var _mc:MovieClip;				public var loadDone:Boolean;				public function PreloaderInst(){					}				/*		** stg:Object = shell fla's stage or MC placeholder		** url:String = location of child SWF		** example: Preloader.init( stage, "myMovie.swf" );		**			Preloader.initLoadingText( txtName );		**			Preloader.initLoadingBar( mcName );		**********************************************************/		public function init(stg:Object, url:String){			_stg = stg;						loader = new Loader();			loader.load(new URLRequest(url));						_stg.addEventListener(Event.ENTER_FRAME, actionF);						i = -1;			i++;			if(i == 0){				loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, loadProg);			}		}				/* 		*	init textfield to show percentage of loading progress 		*********************************************************/		public function initLoadingText(t:TextField){			_text = t;		}				/* 		*		init x-axis loading bar mc		******************************************/		public function initLoadingBar(mc:MovieClip){						_mc = mc;					}						private function actionF(e:Event){			if(loadValue < maxValue){				loadValue++;								if(_text != null){					_text.text = loadValue + '';				}								if(_mc != null){					_mc.scaleX = (loadValue / maxValue) ;				}								trace(loadValue);			}			else if(loadValue == maxValue && maxValue == 100){				_stg.removeEventListener(Event.ENTER_FRAME, actionF);								if(_text != null){					_text.text = '';				}				if(_mc != null){					_mc.visible = false;				}								displayLoadedContent();			}		}				private function loadProg(e:ProgressEvent){			var perc:Number = Math.floor((e.bytesLoaded / e.bytesTotal) * 100);			maxValue = perc;			if(maxValue > perc){				maxValue = 100;			}		}				/* 		* 		visually display loaded SWF		****************************************/		public function displayLoadedContent(){						_stg.addChild(loader);						var temp = loader.content;			if(temp.currentFrame != temp.totalFrames){				temp.gotoAndPlay(2);			}			loadDone = true;		}			}}