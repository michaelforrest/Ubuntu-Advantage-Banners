import com.lbi.framework.mvc.io.xml.XMLModel;

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
class com.lbi.core.model.Hyperlink {
	public static var BLANK : String = "_blank";
	public static var SELF : String = "_self";
	public static var PARENT : String = "_parent";
	public static var TOP : String = "_top";

	public var text : String;
	public var href : String;
	public var target : String;
	/**
	 * optionally supply an object literal with
	 * {text:'text',href:'http://href',target:'_blank'} (target is optional)
	 */
	public function Hyperlink() {
		var literal : Object = arguments[0];
		if(literal) {
			text = literal.text;
			href = literal.href;
			target = literal.target || target;
		}
	}

	public function follow() : Void{
		getURL(href,target);
	}
	public function toString() : String{
		return "[Hyperlink text=" + text + ", href=" + href+ ", target=" + target + "]";
	}

	public static function createFromXMLModel($model : XMLModel) : Hyperlink {
		return new Hyperlink({
			text: $model.toString(),
			href: $model.href,
			target: $model.target
		});
	}
}