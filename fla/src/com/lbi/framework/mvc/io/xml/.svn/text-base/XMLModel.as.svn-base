import com.lbi.debug.Log;
import com.lbi.reflection.PropertyUtils;
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
dynamic class com.lbi.framework.mvc.io.xml.XMLModel extends Array {
	
	private static var TEXT_NODE : Number = 3;

	private var __text__:String;
	private var __depth__:Number;
	
	public function XMLModel(node:XMLNode,$depth:Number)  {
		__depth__ = $depth || 0;
		if(!node) return;
		parseAttributes(node);
		if(node.firstChild.nodeType==TEXT_NODE){
			__text__ = node.firstChild.nodeValue;
			return;
		}
		PropertyUtils.hide(this, ["__text__","__depth__"]);
		parseChildren(node);
	}
	private function parseChildren(node : XMLNode) : Void {
		//Log.debug("number of child nodes on "+node.nodeName+":" + node.childNodes.length);
		for (var i : Number = 0; i < node.childNodes.length; i++) {
			var child:XMLNode = node.childNodes[i];
			var node_name : String = child.nodeName;
			//trace("child node:  "+ node_name + ".length=" + child.childNodes.length);
			var model : XMLModel = new XMLModel(child, __depth__+1); // this is where we recurse
			//Log.debug('checking existence of ' + node_name);
			if(node_name == 'null') Log.warn("This isn't so good...");
			if(this[node_name].length==null){
				//trace("creating new node for " + node_name + " at depth " + __depth__);
				this[node_name] = new XMLModel(null,__depth__+1); // should this really be an XMLModel? 	
			}
			this[node_name].push(model);
		}
	}

	private function parseAttributes(node : XMLNode) : Void {
		for (var name : String in node.attributes) {
			this[name] = node.attributes[name];
		}
	}
	/*
	 * if you ask for model.description, this pushes through to model.description[0].value
	 */
	private function __resolve(property_name:String):Object{
		if(this.length>0){
			return this[0][property_name];
		}
		//Log.warn("failed to resolve property " + property_name + "(length: " + length + ")");
		return null;
	}
	public function toString() :String{
		return valueOf();	
	}
	public function valueOf() :String{
		return __text__;
	}
	public function inspect() : String{
		var rtn : String = "";
		for (var i : String in this) {
			rtn += tabs() + i + "{\n " + (this[i].inspect()||this[i]) + "\n}";
		}
		return rtn;	
	}
	private function tabs() : String{
		var rtn:String = "";
		for (var i : Number = 0; i < __depth__; i++) {
			rtn+="  ";
		}
		return rtn;
	}
	public static function createFromXMLString($xml : String) : XMLModel {
		var xml:XML = new XML($xml);
		xml.ignoreWhite = true;
		return new XMLModel(xml.firstChild);
		
	}
	public function findByValue(property:String, value:String) :XMLModel{
		if(this[property]==value) return this;
		for (var i : String in this) {
			var child:XMLModel = this[i];
			var found : XMLModel = child.findByValue(property,value);
			if(found) return found;
		} 
		return null;
	}

}