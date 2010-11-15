import com.lbi.core.events.Event;
import com.lbi.core.helper.Attach;
import com.lbi.core.view.MovieClipWithEvents;
[Event("enter_frame")]
/**
 	LBi Useful ActionScript 2 Library
    Copyright (C) 2007 LBi / Michael Forrest

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA 
*/
class com.lbi.animation.util.Engine extends MovieClipWithEvents {
	public static var ENTER_FRAME:String = "enter_frame";
	
	private static var engine_mc:Engine;
	
	function onEnterFrame() : Void {
		dispatchEvent(new Event(ENTER_FRAME));
	}
	public static function getClip():Engine{
		if(!engine_mc){
			engine_mc = Attach.MovieClipClass(_root, Engine, _root.getNextHighestDepth());
		}
		return engine_mc;
	}
	public function getListenerCount():Number{
		return Array(this["__q_"+ ENTER_FRAME]).length;
	}
	public static function advanceFrames(number_of_frames : Number) : Void {
		for (var i : Number = 0; i < number_of_frames; i++) {
			engine_mc.onEnterFrame();
		}
	}

}