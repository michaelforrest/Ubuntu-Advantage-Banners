import com.lbi.debug.LogItemType;
import com.lbi.debug.LogType;
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
class com.lbi.debug.Log
{
	private static var DEFAULT_LEVEL : Number = 5;
	private static var log_level : Number;
	public static function setLogLevel ( level : Number ) : Void 	{ log_level = level; }
	public static function getLogLevel () : Number
	{
		if(log_level == null) log_level = _level0["log_level"] || DEFAULT_LEVEL;
		return log_level;
	}

	private static var last_message : String;
	private static var last_message_type : LogType;
	
	public static function debug(message : String) : Void
	{
		output(LogType.DEBUG, message);
	}
	public static function info	(message : String) : Void
	{
		output(LogType.INFO, message);
	}
	public static function warn (message : String) : Void
	{
		output(LogType.WARNING, message);
	}
	public static function error(message : String) : Void
	{
		output(LogType.ERROR, message);
	}
	public static function fatal(message : String) : Void
	{
		output(LogType.FATAL, message);
	}
	
	private static function output(type : LogType, message : String) : Void
	{
		if(getLogLevel()<type.level) return;
		last_message_type = type;
		last_message = message;
		trace("[" + type.toUpperCase() + "] " + message);
	}

	public static function getLastMessage() : String
	{
		return last_message;	
	}
	public static function getLastMessageType() : LogType
	{
		return last_message_type;	
	}
	
	public static function clear() : Void
	{
		last_message = null;
		last_message_type = null;
	}
	
	public static function custom( message : String, foreground_colour : Number, background_colour : Number, bold : Boolean, level : Number ) : Void
	{
		if(level != null && getLogLevel()<level) return;
		var command : String = "[custom";
		if(foreground_colour != null) 	command += " foreground=#" + getHex(foreground_colour);
		if(background_colour != null) 	command += " background=#" + getHex(background_colour);
		if(bold == true)  				command += " bold=true";
		command += "] " + message;
		
		last_message_type = LogType.CUSTOM;
		last_message = command;
		
		trace(command);
	}
	
	public static function createGroup(id : String, foreground_colour : Number, background_colour : Number, bold : Boolean, level : Number ) : Void
	{
		createItemCommand(LogItemType.GROUP, id, foreground_colour, background_colour, bold, level);
	}
	
	public static function group ( id : String, message : String ) : Void
	{
		item(LogItemType.GROUP, id, message);
	}
	
	public static function createElement(id : String, foreground_colour : Number, background_colour : Number, bold : Boolean, level : Number ) : Void
	{
		createItemCommand(LogItemType.ELEMENT, id, foreground_colour, background_colour, bold);
	}
	
	public static function element ( id : String, message : String ) : Void
	{
		item(LogItemType.ELEMENT, id, message);
	}
	
	private static var items : /*Number*/ Array;
	
	private static function createItemCommand(type : LogItemType, id : String, foreground_colour : Number, background_colour : Number, bold : Boolean, level : Number ) : Void
	{
		if(id.split(" ").length>1){
			error("Log::createItemCommand, id shouldn't contain empty spaces");
			return;
		}
		var command : String = "[setup-" + type + " " + id;
		if(foreground_colour != null) 	command += " foreground=#" + getHex(foreground_colour);
		if(background_colour != null) 	command += " background=#" + getHex(background_colour);
		if(bold == true)  				command += " bold=true";
		command += "]";
		
		if(level == null) level = 0;
		registerItem(type, id, level);
		
		last_message_type = LogType.CUSTOM;
		last_message = command;
		
		trace(command);
	}

	private static function registerItem(type : LogItemType, id : String, level : Number) : Void
	{
		if(items == null) items = [];
		items[type + "-" + id] = level;
	}
	
	private static function getHex ( colour : Number ) : String
	{
		var hex : String = colour.toString(16);
		for (var i : Number = hex.length; i < 6; i++)  hex = "0" + hex;
		return hex;
	}

	private static function item(type : LogItemType, id : String, message : String) : Void
	{
		var item_level : Number = items[getItemId(type,id)];
		if(item_level != null && getLogLevel()<item_level) return;
		
		last_message_type = LogType.CUSTOM;
		last_message = "[" + type + " " + id + "] " + message;
		trace(last_message);
	}
	
	private static function getItemId ( type : LogItemType, id : String ) : String
	{
		return type + "-" + id;
	}
	
	private static var mInit : Boolean = true;
	private static var mTabs : String = "";
	private static var mOpenChar : String;
	private static var mCloseChar : String;
	private static var initCloseChar:String;
	
	/**
	 * Recursively trace an object structure to the _trace method
	 * 
	 * @param obj Object
	 * @param inOpenChar String
	 * @param initialBlockDisplayed Boolean
	 */
	public static function traceObj (obj : Object, inOpenChar : String, initialBlockDisplayed : Boolean ) : Void {
		mInit = (initialBlockDisplayed) ? false : true;
		if (mInit) {
			mInit = false;
			if (obj instanceof Array) {
				mOpenChar = "[";
				initCloseChar = "]";
			} else {
				mOpenChar = "{";
				initCloseChar = "}";
			}
			trace (mOpenChar);
		}
		mTabs += "\t";
		mOpenChar = inOpenChar;
		for (var i : String in obj) {
			if (typeof (obj [i]) == "string") {
				trace (mTabs + i + ": \"" + obj [i] + "\"");
			} else if (typeof (obj [i]) == "object") {
				if (obj [i] instanceof Array) {
					trace (mTabs + i + " : [");
					traceObj (obj [i] , "[", true);
				} else {
					trace (mTabs + i + " : {");
					traceObj (obj [i] , "{", true);
				}
			} else {
				trace (mTabs + i + ": " + obj [i]);
				mInit = true;
			}
		}
		mTabs = mTabs.substr (0, mTabs.length - 1);
		mCloseChar = (mOpenChar == "[") ? "]" : "}";
		mCloseChar = (!initialBlockDisplayed)? initCloseChar : mCloseChar;
		trace (mTabs + mCloseChar);
	}

}