import com.lbi.animation.single.Animation;
import com.lbi.animation.single.MethodWithCompleteEvent;
import com.lbi.animation.util.IAnimation;
import com.lbi.core.events.EventDispatcher;
import com.lbi.core.events.IEvents;
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
class com.lbi.animation.util.GroupCommon extends EventDispatcher{
	private var items:/*IAnimation*/ Array;
	private var label:String = "";
	public function GroupCommon($items:Array) {
		items = new Array();
		for(var i:Number=0; i<$items.length; i++){
			var item:Animation = $items[i];
			addAnimation(item);
		}
	}
	/**
	 * The only requirement is that the object:IEvent dispatches an event 
	 * named in complete_event when it's finished its thang
	 * If you set complete_event to null or undefined, then the method is called synchronously.
	 * @param - the object executing the method
	 * @param - a delegate for the method to execute
	 */
	public function addMethod(object:IEvents, method:Function, complete_event:String, args:Array) : Void {
		if(!args) args = [];
		var new_method:MethodWithCompleteEvent = new MethodWithCompleteEvent(object,method,complete_event,args);
		addItem(new_method);
		
	}
	private function addItem(animation : IAnimation) : Void {
		items.push(animation);
	}
	public function addAnimation(animation:IAnimation) : Void {
		addItem(animation);
	}
	public function addLabel(l:String) : Void {
		this.label = l;	
	}
}