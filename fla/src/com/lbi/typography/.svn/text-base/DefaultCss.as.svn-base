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
class com.lbi.typography.DefaultCss {
	/**
	 * Recognized values are left, center, and right.
	 */
	public var textAlign:String;
	/**
	 * Only the numeric part of the value is used; units (px, pt) are not parsed; pixels and points are equivalent.
	 * YOU MUST SPECIFY px or pt NEVERTHELESS!
	*/
	public var fontSize:String ;
	/**
	 * Recognized values are none and underline.
	 */
	public var textDecoration:String;
	/**
	 * Only the numeric part of the value is used. Units (px, pt) are not parsed; pixels and points are equivalent.
	 * YOU MUST SPECIFY px or pt NEVERTHELESS!
	 */
	public var marginLeft:String;
	/**
	 * Only the numeric part of the value is used. Units (px, pt) are not parsed; pixels and points are equivalent.
	 * YOU MUST SPECIFY px or pt NEVERTHELESS!
	 */	public var marginRight:String ;
	/**
	 * normal|bold
	 */
	public var fontWeight:String;
	/**
	 * Recognized values are normal and italic.
	 */
	public var fontStyle:String;
	/**
	 * Only the numeric part of the value is used. Units (px, pt) are not parsed; pixels and points are equivalent.
	 * YOU MUST SPECIFY px or pt NEVERTHELESS!
	 */
	public var textIndent:String;
	/**
	 * A comma-separated list of fonts to use, in descending order of desirability. Any font family name can be used. If you specify a generic font name, it will be converted to an appropriate device font. The following font conversions are available: mono is converted to _typewriter, sans-serif is converted to _sans, and serif is converted to _serif.
	 */
	public var fontFamily:String;
	/**
	 * Only hexadecimal color values are supported. Named colors (like blue) are not supported.
	 * You must specify values in #FFFFFF format
	 */
	public var color:String;
	/**
	 * Supported values are inline, block, and none.
	 */
	public var display:String;
	
	// HELPER FUNCTIONS
	/**
	 * convert 0xFFFFFF to #FFFFFF
	 */
	public static function convertColourToCss(colour:Number):String{
		return "#" + colour.toString(16);
	}
}