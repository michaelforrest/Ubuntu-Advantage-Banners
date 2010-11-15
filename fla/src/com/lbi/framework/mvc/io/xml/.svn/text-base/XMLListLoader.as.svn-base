import com.lbi.core.events.Event;
import com.lbi.core.events.EventDispatcher;
import com.lbi.core.helper.Delegate;
import com.lbi.debug.Log;
import com.lbi.framework.mvc.collection.Collection;
import com.lbi.framework.mvc.io.xml.XMLModel;
[Event("ready")]
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
class com.lbi.framework.mvc.io.xml.XMLListLoader extends EventDispatcher {

	private var url : String;

	private var item_class : Function;

	private var path_to_items : String;

	private var __xml : XML;

	private var __collection : Collection;
	
	//new XMLListLoader(FlashVars.getOfficesURL(), Office , "offices.office");
	public function XMLListLoader($url:String,$item_class : Function, $path_to_items:String) {
		super();
		url = $url;
		item_class = $item_class;
		path_to_items = $path_to_items;
		var xml :XML = new XML();
		xml.ignoreWhite = true;
		xml.onData = Delegate.create(this,onData);
		xml.load(url);
	}


	private function onData(src:String) : Void{
		if(!src) Log.error("Failed to load " + url + " [from " + _root._url + "]");
		stripProcessingInstructions(src);
		prepare();
		dispatchEvent(new Event(Event.READY));	 
	}
		
//	private function onLoad(success:Boolean) : Void {
//	}
	
	private function stripProcessingInstructions(src:String) : Void {
		var lines : Array = src.split("\n");
		var result : Array = new Array();
		for (var i : Number = 0; i < lines.length; i++) {
			var line:String = lines[i];
			if(line.indexOf("<?")==-1) {
				result.push(line);
			}else{
				//Log.warn("removing line "  +line +" from xml file: " + url);	
			}
		}
		__xml = new XML();
		__xml.ignoreWhite =true;
		__xml.parseXML(result.join("\n"));
	}

	private function prepare() : Void {
		__collection = new Collection();
		
		var models:Array = getModelList();
		if(!models) {
			Log.warn("Didn't find an array at " + path_to_items);
			return;
		}
		if(models.length==0) {
			return;
		}	
		for (var i : Number = 0; i < models.length; i++) {
			var model:XMLModel = models[i];
			var parsed_model :Object = new item_class(model);
			__collection.push(parsed_model);
		}
	}
	private function getModelList() : Array {
		var parts:Array = path_to_items.split(".");
		if(!__xml.firstChild) Log.error("XML not ready yet!");
		var model:XMLModel = new XMLModel(__xml,0);
		if(!model) Log.error("didn't manage to turn xml into an XMLModel" );
		return digIntoXMLModel(model,parts);
	}
	
	private function digIntoXMLModel($model:XMLModel, parts:Array):XMLModel{
		var next_model_name:String = String(parts.shift());
		var next_model:XMLModel = $model[next_model_name];
		
		//if(next_model==undefined) {
		//	Log.error("Couldn't find [" + next_model_name + "] node in " + $model);
		//}
		return parts.length > 0 ? digIntoXMLModel(next_model, parts) : next_model;
	}
	public function getItems() : Collection {
		return __collection;
		
	}

	public static function initialize($class : Function, $collection_name:String, $xml_url : String, $path_to_items : String) : EventDispatcher{
		var __events__ : EventDispatcher = new EventDispatcher();
		var __loader__ : XMLListLoader = new XMLListLoader($xml_url,$class,$path_to_items);
		var __onXMLLoaded : Function = function() {
			$class[$collection_name] = __loader__.getItems();
			__events__.dispatchEvent(new Event(Event.READY));
		};
		__loader__.addEventListener(Event.READY,__onXMLLoaded);
		return __events__;
	}

	

}