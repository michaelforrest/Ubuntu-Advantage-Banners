import com.lbi.core.events.Event;
import com.lbi.core.events.EventQueueItem;
import com.lbi.core.events.IEvents;
import com.lbi.core.helper.Delegate;
import com.lbi.reflection.PropertyUtils;
/// import com.framfab.debug.TraceObject;

/**
 * 	LBi Useful ActionScript 2 Library
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

 * base class for event listening and dispatching
 */
class com.lbi.core.events.EventDispatcher implements IEvents
{
	public static var _fEventDispatcher:EventDispatcher = undefined;
 	public static var exceptions:Object = {move: 1, draw: 1};

	/**
	 * internal function for removing listeners
	 * @param queue
	 * @param event
	 * @param handler  
	 */
	public static function _removeEventListener(queue:Array, event:String, handler:Function):Void
	{
		if (queue != undefined)
		{
			var l:Number = queue.length;
			var i:Number; 
			for (i = 0; i < l; i++)
			{
				var o:EventQueueItem = queue[i];
				if (o.handler === handler || Delegate.isIdenticalHandler(handler,o.handler)) 
				{
					queue.splice(i, 1);
					return;
				}
			}
		}
	}
	
	/**
	 * add listening and dispatching methods to an object
	 * @param object the object to receive the methods
	 */
	public static function initialize(_obj:Object):Void
	{
		if (_fEventDispatcher == undefined)
		{
			_fEventDispatcher = new EventDispatcher();
		}
		_obj.addEventListener = _fEventDispatcher.addEventListener;
		_obj.removeEventListener = _fEventDispatcher.removeEventListener;
		_obj.dispatchEvent = _fEventDispatcher.dispatchEvent;
		_obj.dispatchQueue = _fEventDispatcher.dispatchQueue;
	}

	/**
	 * internal function for dispatching events
	 * @param queueObj contains references to the event queue
	 * @param eventObj properties passed by the event dispatch
	 */ 
	public function dispatchQueue(queueObj:Object, eventObj:Event):Void
	{
		var queueName:String = "__q_" + eventObj.type;
		var queue:/*EventQueueItem*/Array = queueObj[queueName];
		if (queue != undefined)
		{
			var i:String;
			for (i in queue)
			{
				var o:EventQueueItem = queue[i];
				var oType:String = typeof(o.handler);
				var f:Function = o.handler;
				var once_only:Boolean = o.once_only;
				f.apply(queueObj, [eventObj]);
				if(once_only) removeEventListener(eventObj.type, f);
			}
		}
	}

	/**
	 * dispatch the event to all listeners
	 * @param eventObj an Event or one of its subclasses describing the event
	 */
	public function dispatchEvent(eventObj:Event):Void
	{
		if (eventObj.target == undefined) eventObj.target = this;
		this.dispatchQueue(this, eventObj);
	}

	/**
	 * add a listener for a particular event
	 * @param event the name of the event ("click", "change", etc)
	 * @param handler the function or object that should be called	 * @param once_only : if true, this handler is only used once, and then destroyed
	 */
	public function addEventListener(event:String, handler:Function, once_only:Boolean):Void
	{
		var queueName:String = "__q_" + event;
		if (this[queueName] == undefined)
		{
			this[queueName] = new Array();
		}
		PropertyUtils.hide(this, [queueName]);
		EventDispatcher._removeEventListener(this[queueName], event, handler);
		if(once_only==undefined) once_only = false;
		this[queueName].push(new EventQueueItem(handler, once_only));
	}
	/**
	 * remove a listener for a particular event
	 * @param event the name of the event ("click", "change", etc)
	 * @param handler the function or object that should be called (if blank, removes ALL event listeners)
	 */
	public function removeEventListener(event:String, handler:Function):Void
	{
		var queueName:String = "__q_" + event;
		if(handler!=undefined){
			EventDispatcher._removeEventListener(this[queueName], event, handler);
		}else{
			// remove all event listeners
			var q:Array = this[queueName];
			for (var i : Number = 0; i < q.length; i++) {
				q.pop();
			}
		}	
	}
	
}