import com.lbi.core.events.Event;
import com.lbi.framework.mvc.collection.ISelectable;
import com.lbi.framework.mvc.model.EventMapper;
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
class com.lbi.framework.mvc.collection.Selectable extends EventMapper implements ISelectable{
	public static var SELECTED : String = "selected";
	private function dispatchSelected():Void {dispatchEvent(new Event(SELECTED));}
	public static var DESELECTED : String = "deselected";
	private function dispatchDeselected():Void {dispatchEvent(new Event(DESELECTED));}
	
	private var __selected__ : Boolean = false;
	
	public function select() : Void {
		if(__selected__) return;
		__selected__ = true;
		dispatchSelected();
	}

	public function deselect() : Void {
		__selected__ = false;
		dispatchDeselected();
	}

	public function isSelected() : Boolean {
		return __selected__;
	}
	public static function initialize(object:ISelectable) : Void{
		var inst : Selectable = new Selectable();
		//object["__selected__"] = inst["__selected__"];
		object.select = inst.select;
		object.deselect = inst.deselect;
		object.isSelected = inst.isSelected;
	}

}