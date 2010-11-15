import com.lbi.helpers.view.RGB;
import com.lbi.debug.Log;
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
class com.lbi.helpers.view.ColourHelper
{
	public static function interpolate($start:Number, $end:Number, amount:Number):Number{
		var start:RGB = new RGB($start);		var end:RGB = new RGB($end);

		var red:Number = start.red + amount * (end.red - start.red);		var green:Number = start.green + amount * (end.green - start.green);		var blue:Number = start.blue + amount * (end.blue - start.blue);

		var interpolated_colour:RGB = RGB.newFromComponents(red,green,blue);

		return interpolated_colour.getValue();
	}

	public static function getFromString ( colour : String ) : Number
	{
		if(colour == null) return null;
		if(colour.substring(0,1) == "#") colour = colour.substr(1);
		if(colour.substr(0,2) != "0x") colour = "0x" + colour;
		if(colour.length != 8 && colour.length != 10) Log.warn("ColourHelper.getFromString, colour " + colour + " doesn't have the right length");
		var c : Number = Number(colour);
		if(isNaN(c)){
			Log.error("ColourHelper.getFromString, colour " + colour + " couldn't be converted to number");
			return null;
		}
		return c;
	}

	public static function convertTo32(colour24 : Number, alpha : Number) : Number
	{
		if(alpha == null) alpha = 255;
		return (alpha << 24) | (getRed(colour24) << 16) | (getGreen(colour24) << 8) | getBlue(colour24);
	}

	public static function getAlpha(colour : Number) : Number
	{
		return (colour & 0xFF000000) >>> 24;
	}

	public static function getRed(colour : Number) : Number
	{
		return (colour & 0xFF0000) >>> 16;
	}

	public static function getGreen(colour : Number) : Number
	{
		return (colour & 0xFF00) >>> 8;
	}

	public static function getBlue(colour : Number) : Number
	{
		return colour & 0xFF;
	}

}