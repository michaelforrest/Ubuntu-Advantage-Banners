import com.lbi.reflection.ClassReference;
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
class com.lbi.reflection.Introspector {

	private static var IGNORED_PACKAGES : Array = ["System", "Accessibility","Stage","Key","Mouse","Selection"];
	
	public static function getClassName(klazz : Object) : String {
		var full_list_of_classes : Array = getFullListOfClasses();
		var matching_classes : Array = new Array();
		for (var i : Number = 0; i < full_list_of_classes.length; i++) {
			var class_reference:ClassReference = full_list_of_classes[i];
			if(klazz instanceof class_reference.reference) matching_classes.push(class_reference); 
		}
		// Couldn't get this to work, so taking longest class name. Yes, I am evil.
		var match:ClassReference;
		for (var i : Number = 0; i < matching_classes.length; i++) {
			var class_reference:ClassReference = matching_classes[i];
			//trace(class_reference.name+ "?=" + match.name + " = " + (class_reference.reference instanceof match.reference));
			//if((class_reference.reference instanceof match.reference) || !match){
			if(class_reference.name.length > match.name.length || !match){
				match = class_reference;
			}
		}
		return match.name;
	}

	private static function getFullListOfClasses() : Array {
		var list:Array = new Array();
		// _global contains a list of all the classes in the app
		list = list.concat(findClassesIn(_global));
		return list; 		
	}

	private static function findClassesIn(object : Object) : Array {
		var list:Array = new Array();
		for (var i : String in object) {
			if(typeof(object[i]) == 'function'){ // it's a class
				list.push(new ClassReference(i, object[i]));
			}
			else if(isRelevantPackage(object[i],i)){// it's a package
				list = list.concat(findClassesIn(object[i]));
			}		
		}
		return list;		
	}

	private static function isRelevantPackage(object : Object,name:String) : Boolean{
		if(typeof(object)!='object') return false;
		if(name.length < 2) return false; // too short. weird.
		for (var i : Number = 0; i < IGNORED_PACKAGES.length; i++) {
			var package:String = IGNORED_PACKAGES[i];
			if(package==name) return false;
		}
		return true;
	}

	public static function getFunctionName(f : Function) : String {
		var full_list_of_classes:Array = getFullListOfClasses();
		for (var i : Number = 0; i < full_list_of_classes.length; i++) {
			var class_ref:ClassReference = full_list_of_classes[i];
			var function_name:String = findFunction(f,class_ref);
			if(function_name) return function_name;
		}
		return null;
	}

	private static function findFunction(f : Function, class_ref : ClassReference) : String {
		if(class_ref.name == "DummyIntrospectionClass"){
			 trace("methods:" + class_ref.methods.join(","));
		}
		for (var i : Number = 0; i < class_ref.methods.length; i++) {
			var method_ref:FunctionReference = class_ref.methods[i];
			if(method_ref.reference == f) return method_ref.name;
		}
	}

}