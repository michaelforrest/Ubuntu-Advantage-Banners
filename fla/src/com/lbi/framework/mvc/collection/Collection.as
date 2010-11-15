import com.lbi.core.events.Event;
import com.lbi.core.events.EventDispatcher;
import com.lbi.debug.Log;
import com.lbi.framework.mvc.collection.ISelectable;
import com.lbi.framework.mvc.model.EventMapper;
import com.lbi.framework.mvc.model.IEventMapper;
import com.lbi.framework.mvc.view.ViewBase;
[Event("ready")]
[Event("changed")]
[Event("increased")]
[Event("decreased")]
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

 * You will generally register views to the CHANGED event.
 * INCREASED and DECREASED events are not fired if the items loop.
 *
 */
class com.lbi.framework.mvc.collection.Collection extends Array implements IEventMapper{
	public static var READY : String = "ready";
	private function dispatchReady():Void {dispatchEvent(new Event(READY));}

	public static var CHANGED : String = "changed";
	private function dispatchChanged():Void {dispatchEvent(new Event(CHANGED));}

	public static var INCREASED : String = "increased";
	private function dispatchIncreased():Void {dispatchEvent(new Event(INCREASED));}

	public static var DECREASED : String = "decreased";
	private function dispatchDecreased():Void {dispatchEvent(new Event(DECREASED));}

	public static var CHANGED_SIZE : String = "changed_size";
	private function dispatchChangedSize():Void {dispatchEvent(new Event(CHANGED_SIZE));}

	private var __index:Number;
	private function get _index():Number{
		return __index;
	}
	private function set _index(v:Number):Void{
		__index = v;
		_current = this[__index];
	}

	private var __current:Object;
	private function get _current():Object{
		return __current;
	}
	private function set _current(v:Object):Void{
		__current = v;
		__current.select();
	}

	public var loop : Boolean;

	private var __id__ : Number;
	private static var __next_id__ : Number = 0;
	function Collection($array: Array,$loop:Boolean) {
		super();
		importArray($array);
		loop = $loop;
		EventDispatcher.initialize(this);
		EventMapper.initialize(this);
		__id__ = __next_id__++;
	}
	/**
	 * Copies a normal array into this collection.
	 */
	public function importArray($array : Array) :Void{
		while(length>0) pop();
		for (var i : Number = 0; i < $array.length; i++) {
			push($array[i]);
		}
	}
	/**
	 * Returns currently selected item
	 */
	public function current() : Object {
		//if(!_current) Log.warn("nothing is yet selected in " + this);
		return _current;
	}

	private function hasNext() : Boolean {
		return _index+1 < length && length > 0;
	}
	/**
	 * If there is another item in the collection after the current (or the collection is looped) then
	 * this method selects the next item and dispatches Collection.INCREASED, then Collection.CHANGED
 	 * The selected item conventionally dispatches SELECTED and DESELECTED events, encouraged via the use of the ISelectable interface.
	 */
	public function next() : Void {
		if(!hasNext() && !loop) return;
		current().deselect();
		if(hasNext()){
			_index++;
			dispatchIncreased();
		}
		else{
			_index = 0;
		}
		dispatchChanged();
	}

	private function hasPrev() : Boolean {
		return _index > 0;
	}
	/**
	 * If there is another item in the collection before the current (or the collection is looped) then
	 * this method selects the previous item and dispatches Collection.DECREASED, then Collection.CHANGED.
	 * The selected item conventionally dispatches SELECTED and DESELECTED events, encouraged via the use of the ISelectable interface.
	 */
	public function previous() : Void {
		if(!hasPrev() && !loop) return;
		current().deselect();
		if(hasPrev()){
			_index --;
			dispatchDecreased();
		}
		else{
			_index = length-1;
		}
		dispatchChanged();
	}
	/**
	 * selects the required item by reference.
	 * This is useful when you have a button in your view that holds a reference to an item model.
	 * The view can simply call collection.select(model) and the collection will be updated.
	 */
	public function select($item:Object):Number{

		for (var i : Number = 0; i < this.length; i++) {
			var item:Object = this[i];
			if(item===$item) {
				if(i==_index) return i; // already selected
				current().deselect();
				_index = i;
				dispatchChanged();
				return i;
			}
		}
		return null;
	}
	/**
	 * Removes an item from the collection
	 */
	public function remove($item:Object) : Object{
		for (var i : Number = 0; i < this.length; i++) {
			var item:Object = this[i];
			if(item===$item) {
				splice(i,1);
				_index = getIndex(current());
				dispatchChangedSize();
				return item;
			}
		}
		return null;
	}
	/**
	 * finds (without selecting) an item in the array based on the object reference.
	 */
	public function find($item:Object) : Object{
		for (var i : Number = 0; i < this.length; i++) {
			var item:Object = this[i];
			if(item===$item) {
				return item;
			}
		}
	}
	public function first() : Object{
		return this[0];
	}

	public function getCurrentIndex() :Number{
		return _index;
	}
	/**
	 * Returns the index of the specified item in this array.
	 */
	public function getIndex($item:Object) : Number{
		for (var i : Number = 0; i < this.length; i++) {
			var item:Object = this[i];
			if(item==$item) return i;
		}
		//Log.error("Couldn't find item " + $item + " in Collection " + this);
	}
	public function toString() :String{
		return "[Collection id:" + __id__ +" "+super.toString()+"]";
	}
	public function addEventListener(type : String, handler : Function, once_only : Boolean) : Void {}
	public function removeEventListener(type : String, handler : Function) : Void {}
	public function dispatchEvent(e : Event) : Void {}
	public function registerEvents(view : ViewBase, events : Array, class_name_for_debugging : String) : Void {}
	public function getPossibleEvents() : Array {
		return null;
	}
	public function eventIsPossible(event_name : String) : Boolean {
		return null;
	}

	public function findByProperty($property : String, value : Object) : Object {
		for (var i : Number = 0; i < this.length; i++) {
			var item:Object = this[i];
			if(item[$property]==value) return item;
		}
		return null;		
	}
	public function append(collection:Collection) : Void{
		for (var i : Number = 0; i < collection.length; i++) {
			var item:Object = collection[i];
			push(item);
		}
	}
	public function push(value:Object):Number{
		var result : Number = super.push(value);
		dispatchChangedSize();
		return result;	
	}
	
}