package{	import flash.display.*;	import flash.events.*;	import com.tribalframework.utils.calendar.Calendar;		public class CalendarExample extends MovieClip	{		var p; 		public function CalendarExample(){						txt.restrict = "0-9/";			btn.addEventListener(MouseEvent.CLICK, onClick);										}		private function onClick(e:MouseEvent){			p = new Calendar(txt.text);			trace( p.validate() );		}			}	}