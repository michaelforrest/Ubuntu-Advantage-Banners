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
class com.lbi.debug.LogType extends String
{
	public static var FATAL : LogType = new LogType("fatal",0);
	public static var ERROR : LogType = new LogType("error",1);
	public static var WARNING : LogType = new LogType("warning",2);
	public static var INFO : LogType = new LogType("info",3);
	public static var DEBUG : LogType = new LogType("debug",4);
	
	public static var CUSTOM : LogType = new LogType("custom", 0);

	public var level : Number;
	
	
	function LogType(value : String, level : Number) {
		super(value);
		
		this.level = level;
	}

}