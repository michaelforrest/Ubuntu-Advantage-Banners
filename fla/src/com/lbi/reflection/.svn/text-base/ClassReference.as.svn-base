import com.lbi.reflection.FunctionReference;
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
class com.lbi.reflection.ClassReference {
	private var __name:String;
	public function get name():String{
		return __name;
	}
	private var __reference:Function;
	public function get reference():Function{
		return __reference;
	}
	private var __methods:Array;
	public function get methods():Array{
		return __methods;
	}
	public function ClassReference($name:String, $reference:Function) {
		__name = $name;
		__reference = $reference;
		createMethodsArray();
	}	

	private function createMethodsArray() : Void {
		__methods = new Array();
		var proto:Object = __reference.__proto__;
		for (var i : String in proto) {
			if( typeof(proto[i])=='function'){
				var ref:FunctionReference = new FunctionReference(name+"."+i,proto[i]);
				__methods.push(ref);
			}
		}
		//trace( name + "." + __methods.join(","));
	}

}