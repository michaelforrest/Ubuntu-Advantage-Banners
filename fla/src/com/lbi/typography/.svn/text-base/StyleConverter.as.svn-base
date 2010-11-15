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
class com.lbi.typography.StyleConverter {
	/**
	 * Usage:
	 * <pre>
	 * var styles:StyleSheet = new StyleSheet();
	 * styles.setStyle(".className", StyleConverter.convertTextFormatToCSS(class_fmt));
	 * styles.setStyle("elementName", StyleConverter.convertTextFormatToCSS(element_fmt));
	 * txt.styleSheet = styles;
	 * var html_text:String = "<span class='className'>Styled span text</span><elementName>Element text</elementName>";
	 * txt.html = true; // make sure html is switched on
	 * txt.htmlText = html_text;
	 * </pre> 
	 */
	public static function convertTextFormatToCSS(f:TextFormat):Object{
		var o:Object= new Object();
		o.color = "#" + f.color.toString(16);
		o.fontFamily = f.font;
		o.fontSize = f.size;
		o.fontWeight = (f.bold) ? "bold" : "normal";
		o.fontStyle = (f.italic) ? "italic" : "normal";
		o.textAlign = f.align;
		return o;
	}
	public static function convertStringColourToNumber($colour:String):Number{
		return Number("0x" + $colour.split("#").join(""));	
	}
}