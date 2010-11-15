import com.lbi.animation.single.Animation;
import com.lbi.animation.util.Easing;
import com.lbi.core.events.Event;
import com.lbi.core.events.EventDispatcher;
import com.lbi.core.helper.Delegate;
import com.lbi.debug.Log;
import com.lbi.framework.mvc.view.ViewBase;
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
class com.lbi.animation.animator.Transition extends EventDispatcher{
	public static var COMPLETE : String = "complete";
	private function dispatchComplete():Void {dispatchEvent(new Event(COMPLETE));}
	
	public static var DEFAULT_FRAMES : Number = 10;

	// These are the properties that you can change:
	public var frames : Number = DEFAULT_FRAMES;
	public var easing : Function;
	// end of properties you can change.
	
	public var property : String;
	private var object : ViewBase;
	private var animation : Animation;
	private var cache : Number;

	private var start : Number;
	private var end : Number;

	public function Transition($object: ViewBase, $property : String) {
		easing = Easing.easeOutCubic;
		object = $object;
		property = $property;
		cache = object[property];
		if(cache == null) Log.warn("Please set a default value for your '" + $property +"' accessor");
	}
	
	public function trigger($target : Object) : Void {
		if(animation) animation.destroy();
		start = getCurrentValue();
		end = Number($target);
		animation = new Animation(this,animate, 0, 1, frames);
		cache = object[property];
		animation.addEventListener("complete",Delegate.create(this,dispatchComplete));
		animation.go();
	}
	public function interrupt() : Void {
		animation.destroy();
	}

	private function animate(next:Number, prev:Number) : Void {
		if(getCurrentValue()!=cache && cache!=null) {
			interrupt();
		}else{
			object[property] = interpolate(easing(next));		
		}
		cache = getCurrentValue();
	}

	public function getProperty() : String {
		return property;
	}

	private function getCurrentValue() : Number {
		return object[property];
	}

	private function interpolate(pos : Number) : Number {
		return pos * (end-start) + start;
	}
	/**
	 * returns this Transition so that settings can be chained.
	 */
	public function setFrames($frames:Number) : Transition{
		frames = $frames;
		return this;	
	}
	/**
	 * returns this Transition so that settings can be chained
	 */
	public function setEasing($function:Function) :Transition{
		easing = $function;
		return this;
	}
		

}