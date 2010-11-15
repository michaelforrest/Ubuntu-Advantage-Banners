import com.lbi.animation.group.Set;import com.lbi.core.events.Event;import com.lbi.core.events.EventDispatcher;import com.lbi.core.helper.Delegate;import com.lbi.debug.Log;/**
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
class com.lbi.framework.mvc.model.Dependencies {

	private static var PREPARE_ERROR : String = "To use Dependencies.loadInOrder you must create " +
	" static prepare() methods on each class that you pass into the loadInOrder method array. ";
	/**
	 * Dispatches Event.READY when complete
	 */
	public static function loadAtOnce(dependencies : Array) : EventDispatcher {
		var a : Set = new Set();
		for (var i : Number = 0; i < dependencies.length; i++) {
			var d:EventDispatcher = dependencies[i];
			a.addMethod(d,null,Event.READY);
		}
		// copy 'complete'=>'ready' cos that's what the app should be saying
		a.addEventListener("complete",Delegate.create(a,a.dispatchEvent,[new Event(Event.READY)]));
		a.go();
		return a;
	}
	/**
	 * Relies on a static prepare() method against each class passed through
	 * in the dependencies array.
	 */
	public static function loadInOrder(dependencies : Array) : EventDispatcher {
		var events : EventDispatcher = new EventDispatcher();
		var f: Function = function() {
			if(dependencies.length>0){
				var d : Object = dependencies.shift();
				if(!d.prepare) Log.error(Dependencies.PREPARE_ERROR + " in " + d);
				d.prepare().addEventListener(Event.READY,arguments.callee);
			}else{
				events.dispatchEvent(new Event(Event.READY));	
			}
		};
		f();
		return events;
	}


}