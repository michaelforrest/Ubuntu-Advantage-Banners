import flash.geom.Rectangle;

import com.lbi.core.helper.Attach;
import com.lbi.typography.TypographyBase;

import TextField.StyleSheet;
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
* Um... this isn't that good yet... 
 */
class com.lbi.typography.TypographyHelper
{

	public static var MAGIC_PADDING : Number = 4;
	
	
	public static function getLineWidthsPlain(style : TypographyBase, text : String, textfield_width : Number, container : MovieClip) : Array
	{
		var lines : Array = getLinesPlain(style, text, textfield_width, container);
		
		var res : Array = [];
		for(var i:Number=0; i<lines.length; i++){
			res.push(getLineWidthPlain(style, lines[i], container));
		}
		return res;
	}
	
	public static function getLinesNumberPlain (style : TypographyBase, text : String, textfield_width : Number, container : MovieClip) : Number
	{
		return getLinesPlain(style, text, textfield_width, container).length;
	}
	
	private static function getNewLines ( text : String ) : Array
	{	
		var dividers_arr : Array = [/*"\r\n", "\n",*/ "\r"];
		
		var res : Array = [text];
		
		for(var i:Number = 0; i<dividers_arr.length; i++){
			var divider : String = dividers_arr[i];
			res = getNewLinesByDivider(res, divider);
		}
		
		return res;
	}
	
	private static function getNewLinesByDivider ( lines : Array, divider : String ) : Array
	{
		var res : Array = [];
		for(var i:Number = 0; i<lines.length; i++){
			var line : String = lines[i];
			var arr : Array = line.split(divider);
			for(var j:Number = 0; j<arr.length; j++){
				res.push(arr[j]);
			}
		}
		return res;
	}
	
	public static function getLinesPlain (style : TypographyBase, text : String, textfield_width : Number, container : MovieClip) : Array
	{
		if(text.length == 0) return [""];
		
		var new_lines : Array = getNewLines(text);
		
		var res : Array = [];
		
		for(var i:Number=0; i<new_lines.length; i++){
			var line : String = new_lines[i];
			var arr : Array = __getLinesPlain (style, line, textfield_width, container);
			for(var j:Number = 0; j<arr.length; j++){
				res.push(arr[j]);
			}
		}
		
		return res;
	}
	
	private static function __getLinesPlain (style : TypographyBase, text : String, textfield_width : Number, container : MovieClip) : Array
	{
		if(text.length == 0) return [""];
		
		if(container == null) 	container = _root;
		
		var mc : MovieClip = container.createEmptyMovieClip("__getLineWidth_" + container.getNextHighestDepth() + "_" + (Math.random()*1000), container.getNextHighestDepth());
		
		style.multiline = true;
		style.auto_size = "false";
		style.align = "left";
		style.word_wrap = true;
		
		var txt : TextField = Attach.TextField(mc, style,mc.getNextHighestDepth(),new Rectangle(0,0,textfield_width,style.font_size + 4) );
		
		
		
		var lines_arr : Array = [];
		
		while(text.length > 0){
			txt.text = text;
			if(txt.maxscroll>1){
				var words_arr : Array = text.split(" ");
				var pos : Number = 0;
				txt.text = "";
				while(txt.maxscroll<=1 && pos<words_arr.length){
					pos++;
					txt.text = getTextByNumberWords(words_arr, pos);
				}
				pos--;
				
				var line_str : String;
				var chars_to_cut : Number;
				if(pos==0){
					//cut word
					var word : String = words_arr[0];
					var word_len : Number = 0;
					txt.text = "";
					while(txt.maxscroll<=1){
						word_len++;
						txt.text = word.substr(0,word_len);
					}
					word_len--;
					line_str = word.substr(0,word_len);
					chars_to_cut = line_str.length;
				}else{
					line_str = getTextByNumberWords(words_arr, pos);
					chars_to_cut = line_str.length + 1;
				}
				text = text.substring(chars_to_cut, text.length);
				lines_arr.push(line_str);
			}else{
				lines_arr.push(text);
				text = "";
			}
		}
		mc.removeMovieClip();
		
		return lines_arr;
	}
	
	private static function getTextByNumberWords ( array : Array, number : Number ) : String
	{
		var res : String = "";
		for(var i : Number =0; i<number; i++){
			res += array[i];
			if(i<number - 1) res += " ";
		}
		return res;
	}
	
	
	public static function getLineWidthPlain ( style : TypographyBase, text : String, container : MovieClip ) : Number
	{
		if(container == null) 	container = _root;
		
		if(text.length = 0) return 0;
		
		var mc : MovieClip = container.createEmptyMovieClip("__getLineWidth_" + container.getNextHighestDepth() + "_" + (Math.random()*1000), container.getNextHighestDepth());
		
		style.multiline = false;
		style.auto_size = "true";
		style.align = "left";
		style.word_wrap = false;
		
		var txt : TextField = Attach.TextField(mc, style,mc.getNextHighestDepth());
		txt.text = text;
		
		var res : Number = txt.textWidth;
		mc.removeMovieClip();
		
		return res;
	}

	public static function getLineWidths(txt:TextField, html:Boolean):Array{
		var a:Array = new Array();
		for (var i : Number = 0; i < txt.maxscroll; i++) {
			a.push(getLineWidth(txt, i));			
		}
		return a;
	}
	/**
	 * Doesn't work if any words wrap halfway through
	 */
	private static function getLineWidth(txt:TextField, line:Number):Number{
		var width:Number = null;
		var html:String = txt.htmlText;
		var xml:XMLNode = (new XML(html)).firstChild;
		var words:Array = flattenIntoWords(xml);
		convertStylesToInline(txt);
		txt.htmlText = "";
		var current_line:Number = 0;
		var start_word:Number= 0;
		for (var i : Number = start_word; i <= words.length; i++) {
			txt.htmlText = words.slice(start_word,i).join("");
			var on_last_word:Boolean = i==words.length;
			if(txt.maxscroll > 1 || on_last_word){
				if(current_line==line){
					txt.htmlText = words.slice(start_word,i-1).join("");
					width = txt.textWidth;
					break;
				}
				else if(on_last_word){
					if(txt.maxscroll>1){
						start_word = i-1;	
					}
					txt.htmlText = words.slice(start_word, i).join("");
					width = txt.textWidth;
					break;
				}
				else{
					current_line++;
				}
				i--;
				start_word = i;
			}
		}
		txt.htmlText = html;
		return width;
	}
	private static function flattenIntoWords(n : XMLNode) : Array {
		var a:Array = new Array();
		for (var i : Number = 0; i < n.childNodes.length; i++) {
			var c:XMLNode = n.childNodes[i];
			if(c.nodeType==3){
				// TEXT NODE
				var words:Array = c.nodeValue.split(" ");
				words = tagAllChildren(words, n.nodeName, n.attributes);
				a = a.concat(words);
			}
			else{
				// ELEMENT NODE
				var c_array:Array = flattenIntoWords(c);
				c_array = tagAllChildren(c_array, n.nodeName, n.attributes);
				a = a.concat(c_array);
			}
		}
		return a;
	}
	private static function tagAllChildren(a : Array, tag : String, attributes:Object) : Array {
		var r:Array = new Array();
		for (var i : Number = 0; i < a.length; i++) { 
			var s:String = a[i];
			if(s!=""){
				s = wrapTag(s, tag, attributes);
				r.push(s);
			}
		}
		return r;
	}
	private static function wrapTag(content : String,tag: String, att:Object) : String {
		var open_tag:String = "<" + tag;
		for (var i : String in att) {
			open_tag += " " + i + "='"+ att[i] + "'";
		}
		open_tag+= ">";
		return open_tag + content + " </" + tag + ">";
	}

	private static function convertStylesToInline(txt : TextField) : Void {
		var s:StyleSheet = txt.styleSheet;
		var a:Array = s.getStyleNames();
		for (var i : Number = 0; i < a.length; i++) {
			var stylename:String = a[i];
			var style:Object = s.getStyle(stylename);
			style.display = "inline";
			s.setStyle(stylename, style);
		}
		txt.styleSheet = s;
	}
	public static function isHtml(s : String) : Boolean{
		var xml:XML = new XML(s);
		return (xml.nodeType==1);
	}

	public static function isMultiLine(txt : TextField) : Boolean {
		return null;
	}

	public static function heightOfOneLine(txt : TextField) : Number {
		var temp:String = txt.text;
		txt.text = "My";
		var r:Number = txt.textHeight;
		txt.text = temp;
		return r;
	}

	public static function fitHorizontally(txt : TextField) : Void {
		txt._width = txt.textWidth + MAGIC_PADDING;
	}

}