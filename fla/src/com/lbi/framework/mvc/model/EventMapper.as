import com.lbi.core.events.EventDispatcher;
import com.lbi.core.helper.Delegate;
import com.lbi.debug.Log;
import com.lbi.framework.mvc.model.IEventMapper;
import com.lbi.framework.mvc.view.ViewBase;
import com.lbi.helpers.core.StringFormatting;

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
class com.lbi.framework.mvc.model.EventMapper extends EventDispatcher {
	
	/**
	 * Use registerEvents to automatically wire up controller events to which this view must respond.
	 * So, if you do registerEvents(["complete","ready","pressed"]); you would then need to implement methods
	 * respondToComplete(e:Event), respondToReady(e:Event), respondToPressed(e:Event)
	 * @param events = an array of event names dispatched by the controller
	 * @param class_name = the name of the calling class - used for debugging... introspection is too hard!
	 */
	public function registerEvents(view:ViewBase,events : Array, class_name_for_debugging:String) : Void {
		if(!class_name_for_debugging) class_name_for_debugging = "";
		for (var i : Number = 0; i < events.length; i++) {
			var event:String = events[i];
			var pascalized:String = StringFormatting.pascalize(event);
			var method_name:String = "respondTo"+pascalized;
			var responding_method:Function = view[method_name];
			if(!responding_method) {
				var msg:String ="Error - view class "+ class_name_for_debugging + " does not implement " + method_name; 
				Log.error(msg);
				throw new Error(msg);
			}
			/*var dispatching_method_name : String = dispatch+pascalized;
			var dispatching_method:Function = this[dispatching_method_name];
			var in_possible_events:Boolean = eventIsPossible(event);
			if(!dispatching_method && !in_possible_events){
				var msg:String = "Error - controller class for " + class_name_for_debugging + " - " + Introspector.getClassName(this) + " does not implement " + dispatching_method_name;
				msg+="\nEvents allowed by getPossibleEvents:" + getPossibleEvents().join(",");
				Log.error(msg);
				throw new Error(msg);
			}*/
			addEventListener(event,Delegate.create(view,responding_method));
		}
	}
	/**
	 * Override this method to return an array of strings that can be registered as events. 
	 * This is useful if you want to dynamically generate event names (e.g. with keyboard controllers)
	 */
	public function getPossibleEvents():Array{
		return null;	
	}
	public function eventIsPossible(event_name : String) : Boolean {
		var possible_events:Array = getPossibleEvents();
		for (var i : Number = 0; i < possible_events.length; i++) {
			var e:String = possible_events[i];
			if (e==event_name) return true;
		}
		return false;
	}

	public static function initialize(object : IEventMapper) : Void {
		EventDispatcher.initialize(object); // in case it's not already an EventDispatcher
		var inst : EventMapper = new EventMapper();
		object.registerEvents = inst.registerEvents;
		object.getPossibleEvents = inst.getPossibleEvents;
		object.eventIsPossible = inst.eventIsPossible;
	}

}