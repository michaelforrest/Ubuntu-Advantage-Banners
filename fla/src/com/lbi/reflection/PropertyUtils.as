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
class com.lbi.reflection.PropertyUtils {
	private static var IS_HIDDEN : Number = 1;
	private static var CAN_DELETE : Number = 2;
	private static var CAN_OVERWRITE : Number = 4;
	
	/**
	 * hides properties from (for i in this) loops
	 */
	public static function hide(object : Object, properties : Array) : Void {
		_global.ASSetPropFlags(object,properties ,IS_HIDDEN);
	}

}