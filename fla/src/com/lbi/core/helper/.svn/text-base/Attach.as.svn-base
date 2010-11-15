import flash.geom.Rectangle;import com.lbi.debug.Log;import com.lbi.typography.TypographyBase;/**
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

 */
class com.lbi.core.helper.Attach
{
	/**
	 * Used to instantiate Classes that are extensions of the MovieClip class. Used like  
	 * attachMovie(), but with additional specification of target (must be or extend MovieClip) 
	 * and class (likewise) to use. 
	 * 
	 * @param  $parent : any class extending MovieClip - this is where the new clip will be placed
	 * @param  $class  : the classpath of the class to instantiate  
	 * @param  depth : as in MovieClip.AttachMovie - depth in $parent to attach new clip
	 * @param  args - optional constructor function arguments in an object. 
	 * @param  init_obj - optional  as in MovieClip.AttachMovie - object (associative array) containing all initialisation parameters
	 * 
	 * @usage MovieClipClass ($parent, $class, instance_name:String, depth:Number,args:Object,init_obj:Object )
	 */
	public static function MovieClipClass ($parent:MovieClip, $class:Function, $depth:Number, $args:Array, init_obj:Object)  {
		if(!$depth) $depth = $parent.getNextHighestDepth();
		var instance_name : String = "mc_" + $depth;
		if($parent==undefined) Log.error("Couldn't find target movieclip for attaching " + instance_name);
		if($class==undefined) Log.error("Couldn't find class for " + instance_name);
		var _mc:MovieClip = $parent.createEmptyMovieClip (instance_name, $depth);
		if ($class != undefined)
		{
			_mc.__proto__ = $class.prototype;
			for(var i:String in init_obj) _mc[i]=init_obj[i];
			$class.apply (_mc, $args);
			
			_mc.onLoad ();
		}
		return _mc;
	}
	/**
	* <pre>
	* Example
	* // TypographyClass extends TypographyBase
	* var style:TypographyClass = new TypographyClass("StyleName");
	* var txt:TextField = AttachTextField.create(this,style);
	* 
	* </pre>
	 */
	public static function TextField($parent:MovieClip,style:TypographyBase, depth:Number, rectangle:Rectangle):TextField{
		if(!rectangle) rectangle = new Rectangle();
		if(!rectangle.width) rectangle.width = Stage.width;
		if(!rectangle.height) rectangle.height = Stage.height;
		if(!depth) depth = $parent.getNextHighestDepth();
		var instance_name:String = "txt_" + depth;
		$parent.createTextField(instance_name,depth,rectangle.x,rectangle.y,rectangle.width,rectangle.height);
		
		var txt:TextField = $parent[instance_name];
		
		var formats:Object = style.getTextFieldParams();
		for(var i:String in formats) txt[i] = formats[i];
		
		var fmt:TextFormat = style.getTextFormat();
		txt.setNewTextFormat(fmt);
		
		// Workaround for an old bug. Flash can not set the font size to more than 128px
		if (fmt.size >128){
			txt._xscale = txt._yscale = fmt.size/1.28;
			txt._width = rectangle.width/(txt._xscale/100);
			txt._height = rectangle.height/(txt._xscale/100);
		}
		return txt;
	}
	
	public static function emptyMovieClip(parent : MovieClip) : MovieClip {
		var depth : Number = parent.getNextHighestDepth();
		return parent.createEmptyMovieClip("mc_" + depth, depth);
	}
}
