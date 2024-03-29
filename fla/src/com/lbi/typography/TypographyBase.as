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
 * This class eschews the usual naming conventions in favour of something
 * that looks a bit more like CSS. Override the Defaults() method to set the defaults.
 * <pre>
 * class app.helpers.Typography extends TypographyBase {

	private var WHITE : Number = 0xFFFFFF;

	private var ORANGE : Number = 0xF68B1E;

	function Typography(style:String) {
		super(style);
	}
	private function Defaults() : Void{
		font = Linkages.ARIAL;
		colour = WHITE;
	}
	private function H1() : Void{
		font_size = 24;
	}
	private function P() : Void{
		font_size = 12;
	}
	private function Footer() : Void{
		font_size = 16;
	}
	private function ItemHeading() : Void{
		font_size = 16;
		bold = true;
		colour = ORANGE;
	}

}
 * </pre>
 *
 */
class com.lbi.typography.TypographyBase {

	public function TypographyBase(style:String) {
		Defaults();
		if(this[style]!=undefined) {
			this[style]();
		}
	}
	public function changeStyle(txt : TextField, style : Function) : Void {
		this[style]();
		var formats:Object = getTextFieldParams();
		for(var i:String in formats) txt[i] = formats[i];

		var fmt:TextFormat = getTextFormat();
		txt.setNewTextFormat(fmt);
		txt.text = txt.text;
	}


	/*
	 * TextFormat stuff
	 */
	public var font_size : Number = 12;
	public var font : String = "Bodyfont";
	public var colour : Number = 0;
	public var bold : Boolean = false;
	public var italic : Boolean = false;
	public var underline : Boolean = false;
	public var url : String = "";
	public var target : String = "";
	public var align : String = "left";
	public var left_margin : Number = 0;
	public var right_margin : Number = 0;
	public var indent : Number = 0;
	public var leading : Number = 0;

	/*
	 * TextField parameters
	 */
	public var auto_size : String = "left";
	public var background : Boolean = false;
	public var html : Boolean = false;
	public var word_wrap : Boolean = true;
	public var multiline : Boolean = true;
	public var condense_white : Boolean = true;
	public var border : Boolean = false;
	public var selectable : Boolean = false;
	public var embed_fonts : Boolean = true;
	public var type : String = "dynamic";
	/**
	 * Flash 8 only
	 * Can be "normal" or "advanced".
	 * @see gridFitType, thickness and sharpness
	 */
	public var antiAliasType:String = "normal";
	/**
	 * Flash 8 only
	 * Can be "none", "pixel" or "subpixel"
	 */
	public var gridFitType:String;
	/**
	 * Flash 8 only
	 * In range -200 to 200
	 * The thickness of the glyph edges in this TextField
	 * instance. This property applies only
	 * when antiAliasType() is set to "advanced".
	 */
	public var thickness:Number = 0;
	/**
	 * Flash 8 only
	 * The range for sharpness is a number from -400 to 400.
	 */
	public var sharpness:Number = 0;
	/**
	 * Flash 8 only
	 * The amount of space that is uniformly distributed between characters.
	 */
	public var letterSpacing : Number = 0;

	public function Defaults() : Void {
	}

	public function getTextFormat() : TextFormat{
		var tf : TextFormat = new TextFormat(font, font_size, colour,
								bold, italic, underline, url,target, align,
								left_margin, right_margin, indent, leading);
		//flash 8:
			tf.letterSpacing = letterSpacing;
		return tf;
	}
	public function getTextFieldParams():Object{
		var t:Object = new Object(); // TextField
		t.background = background;
		t.embedFonts = embed_fonts;
		t.selectable = selectable;
		t.border = border;
		t.condenseWhite = condense_white;
		t.multiline = multiline;
		t.wordWrap = word_wrap;
		t.html = html;
		t.autoSize = auto_size;
		t.type = type;

		// flash 8
			t.antiAliasType = antiAliasType;
			t.gridFitType = gridFitType;
			t.thickness = thickness;
			t.sharpness = sharpness;
		return t;
	}


}