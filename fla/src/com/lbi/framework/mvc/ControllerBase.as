import com.lbi.core.events.EventDispatcher;
import com.lbi.framework.mvc.view.ViewBase;
import com.lbi.reflection.Introspector;

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
class com.lbi.framework.mvc.ControllerBase extends EventDispatcher{
	
	private static var __next_controller_id__:Number = 0;
	private var __controller__id__:Number;
	public function ControllerBase() {
		super();
		__next_controller_id__++;
		__controller__id__ = __next_controller_id__;
	}
	
	public function toString() : String {
		return "[Controller id:" + __controller__id__ +":"+Introspector.getClassName(this) +"]";
	}
	public function registerEvents(view : ViewBase, events : Array, class_name_for_debugging : String) : Void {
	}

	public function getPossibleEvents() : Array {
		return null;
	}

	public function eventIsPossible(event_name : String) : Boolean {
		return null;
	}

}