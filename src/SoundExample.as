﻿package{	import flash.display.*;	import flash.events.*;		import com.tribalframework.utils.sound.SoundClass;	//import com.greensock.TweenLite;		public class SoundExample extends Sprite	{				public function SoundExample(){			init();		}				private function init(){						SoundClass.initSound("http://www.ddbstaging.com/HOTA/filmcompetition/phase1/music/ambiencelow.mp3",false);						play_btn.addEventListener(MouseEvent.CLICK, p);			stop_btn.addEventListener(MouseEvent.CLICK, s);			seek_btn.addEventListener(MouseEvent.CLICK, sk);						d.addEventListener(MouseEvent.CLICK, df);			u.addEventListener(MouseEvent.CLICK, uf);		}				private function p(e:MouseEvent){			SoundClass.playSound();		}				private function s(e:MouseEvent){			SoundClass.pauseSound();		}				private function sk(e:MouseEvent){			SoundClass.seekTo();		}				private function df(e:MouseEvent){			SoundClass.volDown();		}				private function uf(e:MouseEvent){			SoundClass.volUp();		}	}}