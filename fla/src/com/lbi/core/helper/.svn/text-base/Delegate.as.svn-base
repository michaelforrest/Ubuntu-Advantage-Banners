/**
 * 	LBi Useful ActionScript 2 Library
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

 * The Delegate class delegates the scope of a function to a specific instance.
 * This is the method that it is used for v2 components, and will be 
 * standard for Actionscript 3
 * 
 * @see mx.utils.Delegate
*/
class com.lbi.core.helper.Delegate 
{
	/**
	 * @param obj - A reference to an object. This is the scope in which to run the function.
	 * @param func - A reference to a function.
	 */
	public static function create(obj:Object, func:Function, _params:Array):Function
	{		
		var f:Function = function()
		{
			var target:Object = arguments.callee.target;
			var delegate_func:Function = arguments.callee.func;
			if (_params == undefined){
				return delegate_func.apply(target, arguments);
			} else {
				return delegate_func.apply(target, _params);
			}
		};

		f.target = obj;
		f.func = func;

		return f;
	}
	
	public static function isIdenticalHandler(test : Function, subject : Function) : Boolean {
		return (test.target === subject.target && test.func === subject.func);
	}
}