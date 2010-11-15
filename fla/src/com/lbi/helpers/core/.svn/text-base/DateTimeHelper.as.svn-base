
/**
 	LBi Useful ActionScript 2 Library
    Copyright (C) 2007 LBi / Michael Forrest / Christian Giordano

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
class com.lbi.helpers.core.DateTimeHelper {

	private static var JAN : Number = 0;
	// TODO : get the month from the string that will passively localise it instead of hard coding this array
	private static var MONTHS : Array = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];

	public static var REPLACEMENTS : Array = [
			["MMM",getMonthName],
			["YYYY",getFullYear],
			["DD", getDayOfMonth],
			["hh",getFullHours],
			["mm",getFullMinutes],
			["ss",getFullSeconds]
		];

	public static function getFullMonth ( date : Date ) : String
	{
		return getFullNumber(date.getMonth() + 1);
	}
	
	public static function getFullDate ( date : Date ) : String
	{
		return getFullNumber(date.getDate());
	}
	
	public static function getFullHours ( date : Date ) : String
	{
		return getFullNumber(date.getHours());
	}
	
	public static function getFullMinutes ( date : Date ) : String
	{
		return getFullNumber(date.getMinutes());
	}
	public static function getDayOfMonth ( date : Date ) : String{
		return date.getDate().toString();	
	}
	public static function getFullSeconds ( date : Date ) : String
	{
		return getFullNumber(date.getSeconds());
	}
	public static function getFullYear( date : Date) : String{
		return date.getFullYear().toString();	
	}
	private static function getMonthName ( date : Date) : String{
		return MONTHS[date.getMonth()];	
	}
	private static function getFullNumber ( value : Number ) : String
	{
		return (value<10 ? "0" + value : value.toString());
	}
	
	
	public static function usingDaylightSavingTime() : Boolean{
		var now:Date = new Date();
		var january : Date = new Date();
		january.setMonth(JAN);
		return january.getUTCHours() != now.getUTCHours();
	}
	/**
	 * see public static var REPLACEMENTS
	 */
	public static function formatDate(date : Date, format : String) : String {
		for (var i : Number = 0; i < REPLACEMENTS.length; i++) {
			var replacement:Array = REPLACEMENTS[i];
			var search : String= replacement[0];
			var method : Function = replacement[1];
			format = format.split(search).join(method(date));
		}
		return format;
	}

}