import com.lbi.animation.util.IAnimation;
import com.lbi.core.events.Event;
import com.lbi.core.events.EventDispatcher;
import com.lbi.core.events.IEvents;
import com.lbi.core.helper.Delegate;
[Event("complete")]
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
class com.lbi.animation.single.MethodWithCompleteEvent extends EventDispatcher implements IAnimation {
	private var my_object:IEvents;
	private var my_method:Function;
	private var complete:Boolean = false;

	private var complete_event : String;

	private var my_arguments : Array;

	public function MethodWithCompleteEvent(object:IEvents, method:Function,complete_event:String,args:Array){
		EventDispatcher.initialize(this);
		this.complete_event = complete_event;
		my_object = object;
		my_method = method;
		my_arguments = args;
	}
	public function go() : Void {
		my_object.addEventListener(complete_event, Delegate.create(this, onComplete),true);
		complete = false;
		my_method.apply(my_object,my_arguments);
		if(!complete_event) onComplete();
	}
	private function onComplete() : Void {
		complete = true;
		dispatchEvent(new Event("complete"));
	}
	public function destroy() : Void {
		delete this;
	}

	public function stop(dispatchComplete : Boolean) : Void {
		//my_object.stop();
		if(dispatchComplete) onComplete();
	}

	public function isComplete():Boolean{
			return complete;
	}
	public function setFrames(frames : Number) : Void {
	}
	public function toString():String{
		return "QueueMethod: ";
	}
	public function getStructure() : String {
		return toString();
	}

}