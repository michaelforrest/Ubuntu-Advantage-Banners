import com.lbi.animation.animator.Transition;import com.lbi.debug.Log;import com.lbi.framework.mvc.collection.Searchable;import com.lbi.framework.mvc.view.ViewBase;/**
	LBi Useful ActionScript 2 Library    Copyright (C) 2007 LBi / Michael Forrest    This library is free software; you can redistribute it and/or    modify it under the terms of the GNU Lesser General Public    License as published by the Free Software Foundation; either    version 2.1 of the License, or (at your option) any later version.    This library is distributed in the hope that it will be useful,    but WITHOUT ANY WARRANTY; without even the implied warranty of    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU    Lesser General Public License for more details.    You should have received a copy of the GNU Lesser General Public    License along with this library; if not, write to the Free Software    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA 
 */
dynamic class com.lbi.animation.animator.Animator {
	private var object : ViewBase;
	private var transitions : Searchable;
	
	public function Animator($object : ViewBase) {
		object = $object;
		transitions = new Searchable();
	}
	public function registerTransitions($transitions : Array) : Void{
		for (var i : Number = 0; i < $transitions.length; i++) {
			var property:String = $transitions[i];
			registerTransition(property);
		}
	}
	/** 
	 * Use this method to register any properties you want to tween.
	 * Returns the name of the tweened property.
	 */
	public function registerTransition($property : String) : Void {
		var transition : Transition = new Transition(object,$property);
		watch($property,__watcher,transition);
		transitions.push(transition);
	}
	private function __watcher($property : String, old_val : Object, new_val : Object ,transition:Transition) : Object {
		transition.trigger(new_val);
		return new_val;
	}

	private function setupTransition(transition : Transition, settings : Object) : Void{
		for (var i : String in settings) {
			if(transition[i]!=null){
				transition[i] = settings[i];
			}else{
				Log.error("Transition has no property '" + i + "'" +
				"- please check your use of animator." + transition.getProperty() + "={" + i + ":" + settings[i] + ",...}");	
			}
		}
	}

	public function change($property:String):Transition{
		return Transition(transitions.findByProperty("property", $property));
	}
	public function listen($property:String,$callback:Function):Void{
		change($property).addEventListener(Transition.COMPLETE,$callback,true);
	}
}