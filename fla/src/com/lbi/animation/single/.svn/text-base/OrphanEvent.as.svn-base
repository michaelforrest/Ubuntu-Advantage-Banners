
import com.lbi.animation.util.IAnimation;
import com.lbi.core.events.Event;
import com.lbi.core.events.EventDispatcher;
import com.lbi.core.events.IEvents;
import com.lbi.core.helper.Delegate;
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
class com.lbi.animation.single.OrphanEvent extends EventDispatcher implements  IAnimation{
	public var is_complete:Boolean = false;
	private var object:IEvents;
	private var event:String;
	private var event_delegate:Function;
	private var time_created:Number;

	public function OrphanEvent(object:IEvents, event:String){
		this.object = object;
		this.event = event;
		this.event_delegate = Delegate.create(this, dispatchCompleteEvent);
		object.addEventListener(event, event_delegate);
		this.time_created = getTimer();
	}
	public function stop(dispatchComplete:Boolean) : Void {
		destroy();
		if(dispatchComplete) dispatchCompleteEvent();
	}
	private function dispatchCompleteEvent() : Void {
		is_complete = true;
		dispatchEvent(new Event("complete"));
	}
	/**
	 *  go() does nothing, hence "Orphan".
	 */
	public function go() : Void {
		is_complete = false;
	}
	
	public function isComplete():Boolean{
		return is_complete;	
	}
	public function destroy() : Void {
		object.removeEventListener(event, event_delegate);
	}
	public function toString() : String {
		return object + " OrphanEvent " + time_created + ":"  + event ;	
	}
	public function isOrphanEvent():Boolean{
		return true;
	}
	public function setFrames(frames : Number) : Void {
		// don't do anything though.
	}

	public function getStructure() : String {
		return toString();
	}

}