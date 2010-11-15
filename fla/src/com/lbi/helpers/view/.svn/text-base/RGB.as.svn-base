import flash.geom.ColorTransform;
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
class com.lbi.helpers.view.RGB {
	public var red:Number;
	public var green:Number;
	public var blue:Number;
	
	public function RGB(v:Number) {
		var colour_string:String = v.toString(16);
		this.red = parseInt(colour_string.substr(0,2),16);
		this.green = parseInt(colour_string.substr(2,2),16);
		this.blue = parseInt(colour_string.substr(4,2),16);
	}
	public static function newFromComponents(r:Number,g:Number,b:Number):RGB{
		var c:RGB = new RGB(0x000000);
		c.red = r;
		c.green = g;
		c.blue = b;
		return c;	
	}
	public function getValue():Number{
		return (red << 16 | green << 8 | blue);
	}
}