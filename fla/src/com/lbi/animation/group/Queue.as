import com.lbi.animation.single.Message;
import com.lbi.animation.util.GroupCommon;
import com.lbi.animation.util.IAnimation;
import com.lbi.core.events.Event;
import com.lbi.core.helper.Delegate;
[Event("complete")]
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
class com.lbi.animation.group.Queue extends GroupCommon implements IAnimation {
	
	private var current_item:Number = 0;
	private var is_complete:Boolean = false;

	/**
	 * @param $items is optional 
	 */
	function Queue($items:Array){
		super($items);
		playNextItem = Delegate.create(this,playNextItem);
		items = new Array();
	}
	
	public function go() : Void {
		is_complete = false;
		playItem(current_item);
	}
	
	private function playItem(item_id:Number) : Void {
		var item:IAnimation = items[item_id];
		var complete_delegate:Function = Delegate.create(this, playNextItem); 
		//item.setCompleteDelegate(complete_delegate);
		item.addEventListener("complete", complete_delegate);
		item.go();
	}
	
	private function playNextItem(e:Event) : Void {
		var item:IAnimation = items[current_item];
		current_item++;
		if(current_item < items.length){
			playItem(current_item);	
		}
		else{
			dispatchCompleteEvent();
		}
	}
	public function stop(dispatchComplete:Boolean) : Void {
		IAnimation(items[current_item]).stop();
		current_item = 0;
		if(dispatchComplete) dispatchCompleteEvent();
	}
	private function dispatchCompleteEvent() : Void {
		is_complete = true;
		current_item = 0;
		dispatchEvent(new Event("complete"));
	}

	public function isComplete():Boolean{
		return is_complete;	
	}
	public function getType():String {
		return "queue";
	}
	public function destroy() : Void {
		for(var i:String in items){
			var item:IAnimation = items[i];
			//item.removeEventListener("complete" , item.getCompleteDelegate());
			item.destroy();
		}	
		delete this;
	}
	public function addMessage(message : String) : Void {
		var m:Message = new Message(message);
		addItem(m);
	}


}