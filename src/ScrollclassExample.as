﻿package{	import flash.display.*;	import flash.events.*;	import com.pixelbreaker.ui.osx.MacMouseWheel;	import com.tribalframework.ui.scrollclass.ScrollClass2;	import com.earthbrowser.ebutils.MacMouseWheelHandler;		public class ScrollclassExample extends Sprite	{		private var sc:ScrollClass2;		public function ScrollclassExample(){						MacMouseWheelHandler.init(stage);						sc = new ScrollClass2();			sc.create(mainmc.sb.track, mainmc.sb.thumb, mainmc.content_mc, mainmc.masker, stage);			mainmc.content_mc.btn.addEventListener(MouseEvent.CLICK, ff);		}		function ff(e:MouseEvent){			trace("kikik");		}				/*private function mouseScrollHandler(e:MouseEvent){						if(e.delta < 0){				if(sb.thumb.y < stage.stageHeight - sb.thumb.height){					sb.thumb.y += 8;				}			}			if(e.delta > 0){				if(sb.thumb.y > 0){					sb.thumb.y -= 8;				}			}					}*/			}}