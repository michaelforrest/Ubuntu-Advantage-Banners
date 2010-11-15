import com.lbi.core.events.Event;
import com.lbi.core.events.EventDispatcher;
[Event("triggered")]
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

class com.lbi.framework.mvc.io.KeySequenceTrigger extends EventDispatcher {

	private var trigger : String;
	private var so_far_so_good : Boolean = false;

	private var next_character_index : Number = 0;
	
	function KeySequenceTrigger(to_listen_for : String) {
		super();
		trigger = to_listen_for;
		Key.addListener(this);
	}
	private function onKeyUp() :Void{
		//trace("String pressed: "+ String.fromCharCode(Key.getCode()));
		if(String.fromCharCode(Key.getAscii())==getNextCharacter()){
			if(isLastCharacter()){
				dispatchEvent(new Event("triggered"));
				reset();
			}
		}
		else{
			reset();
		}
	} 
	private function getNextCharacter() : String {
		var c:String = trigger.charAt(next_character_index);
		next_character_index++;
		//trace("next char: " +c);
		return c;
	}

	private function isLastCharacter() : Boolean {
		return next_character_index >= trigger.length;
	}

	private function reset() : Void {
		next_character_index = 0;
	}

}