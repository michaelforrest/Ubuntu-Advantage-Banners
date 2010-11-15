import flash.geom.Rectangle;

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

class com.lbi.helpers.view.SimpleDrawing {
	
	static function rectangle(_mc:MovieClip, rectangle:Rectangle, colour:Number, alpha:Number) : Void {
		/// _mc.lineStyle(0, 0, 0);
		
		if(alpha==undefined) alpha = 100;
		_mc.moveTo(rectangle.x,rectangle.y);
		_mc.beginFill(colour, alpha);
		_mc.lineTo(rectangle.x + rectangle.width, 	rectangle.y);
		_mc.lineTo(rectangle.x + rectangle.width, 	rectangle.y + rectangle.height);
		_mc.lineTo(rectangle.x, 					rectangle.y + rectangle.height);
		_mc.endFill();
	}
	
	
	
	public static function randomColour():Number{
		return 0xFFFFFF * Math.random(); 
	}

	
	public static function outline(mc:MovieClip, colour:Number, thinkness:Number) : Void {
		var w:Number = mc._width;
		var h:Number = mc._height;
		var t:Number = (thinkness||2);
		mc.moveTo(0,0);
		mc.lineStyle(t, colour, 80);
		mc.lineTo(w, 0);
		mc.lineTo(w, h);
		mc.lineTo(0, h);
		mc.lineTo(0,0);
	}
	
	static function circle(_mc:MovieClip, x:Number, y:Number, radius:Number, colour:Number, filled:Boolean) : Void {
    	_mc.lineStyle(0, colour);
    	if (filled) {
    		_mc.beginFill(colour);
		}    	
    	_mc.moveTo(x+radius, y);
	    _mc.curveTo(radius+x, Math.tan(Math.PI/8)*radius+y, Math.sin(Math.PI/4)*radius+x, Math.sin(Math.PI/4)*radius+y);
	    _mc.curveTo(Math.tan(Math.PI/8)*radius+x, radius+y, x, radius+y);
	    _mc.curveTo(-Math.tan(Math.PI/8)*radius+x, radius+y, -Math.sin(Math.PI/4)*radius+x, Math.sin(Math.PI/4)*radius+y);
	    _mc.curveTo(-radius+x, Math.tan(Math.PI/8)*radius+y, -radius+x, y);
	    _mc.curveTo(-radius+x, -Math.tan(Math.PI/8)*radius+y, -Math.sin(Math.PI/4)*radius+x, -Math.sin(Math.PI/4)*radius+y);
	    _mc.curveTo(-Math.tan(Math.PI/8)*radius+x, -radius+y, x, -radius+y);
	    _mc.curveTo(Math.tan(Math.PI/8)*radius+x, -radius+y, Math.sin(Math.PI/4)*radius+x, -Math.sin(Math.PI/4)*radius+y);
	    _mc.curveTo(radius+x, -Math.tan(Math.PI/8)*radius+y, radius+x, y);
    	if (filled) {
    		_mc.endFill();
		}  
	}
	
	static function roundedRectangle ( _mc : MovieClip, rectangle:Rectangle, radius : Number, colour : Number, filled : Boolean, $alpha:Number) : Void
	{
		var x : Number = rectangle.x;
		var y  :Number = rectangle.y;
		var width : Number = rectangle.width;
		var height : Number = rectangle.height;
		if(!$alpha) $alpha = 100;
		if (filled) {
    		_mc.beginFill(colour, $alpha);
		}else{
			_mc.lineStyle(0, colour);
		}
		var dub_radius : Number = radius * 2;
		var straight_w : Number = width - dub_radius;
		var straight_h : Number = height - dub_radius;
		_mc.moveTo(x + width, y + straight_h + radius);
		
	    _mc.curveTo(x + width, y + straight_h + radius + Math.tan(Math.PI/8)*radius, x + straight_w + radius + Math.sin(Math.PI/4)*radius, y + straight_h + radius + Math.sin(Math.PI/4)*radius);
	    _mc.curveTo(x + straight_w + radius + Math.tan(Math.PI/8)*radius, y + height, x + straight_w + radius, y + height);
	    _mc.lineTo(x + radius, y + height);
	    
	    _mc.curveTo(x + radius - Math.tan(Math.PI/8)*radius, y + height, x + radius - Math.sin(Math.PI/4)*radius, y + straight_h + radius + Math.sin(Math.PI/4)*radius);
	    _mc.curveTo(x, y + straight_h + radius + Math.tan(Math.PI/8)*radius, x, y + straight_h + radius);
	    _mc.lineTo(x, y + radius);
	    
	    _mc.curveTo(x, y + radius - Math.tan(Math.PI/8)*radius, -Math.sin(Math.PI/4)*radius+x + radius, y + radius - Math.sin(Math.PI/4)*radius);
	    _mc.curveTo(x + radius - Math.tan(Math.PI/8)*radius, y, x + radius, y);
	    _mc.lineTo(x + straight_w + radius, y);

	    _mc.curveTo(x + straight_w + radius + Math.tan(Math.PI/8)*radius, y, x + straight_w + radius + Math.sin(Math.PI/4)*radius, y + radius - Math.sin(Math.PI/4)*radius);
	    _mc.curveTo(x + width, y + radius - Math.tan(Math.PI/8)*radius, x  + width, y + radius);
	    _mc.lineTo(x + width, y + straight_h + radius);
    	if (filled) {
    		_mc.endFill();
		}  
	}
	static function roundedRectangleWithPoint ( _mc : MovieClip, x : Number, y : Number, width : Number, height : Number, radius : Number, colour : Number, filled : Boolean, $alpha:Number) : Void
	{
		//var tenPercent:Number = width*0.1;  Ten percent of width
		var triangleWidth:Number = 16;//Fixed
		if(!$alpha) $alpha = 100;
		if (filled) {
    		_mc.beginFill(colour, $alpha);
		}else{
			_mc.lineStyle(0, colour);
		}
		var dub_radius:Number = radius * 2;
		var straight_w : Number = width - dub_radius;
		var straight_h : Number = height - dub_radius;
		_mc.moveTo(x + width, y + straight_h + radius);
		
		//bottom right corner
	    _mc.curveTo(x + width, y + straight_h + radius + Math.tan(Math.PI/8)*radius, x + straight_w + radius + Math.sin(Math.PI/4)*radius, y + straight_h + radius + Math.sin(Math.PI/4)*radius);
	    _mc.curveTo(x + straight_w + radius + Math.tan(Math.PI/8)*radius, y + height, x + straight_w + radius, y + height);
	    _mc.lineTo(x + radius, y + height);
	    
	    //bottom left corner
	    _mc.curveTo(x + radius - Math.tan(Math.PI/8)*radius, y + height, x + radius - Math.sin(Math.PI/4)*radius, y + straight_h + radius + Math.sin(Math.PI/4)*radius);
	    _mc.curveTo(x, y + straight_h + radius + Math.tan(Math.PI/8)*radius, x, y + straight_h + radius);
	    _mc.lineTo(x, y + radius);
	    
	    //top left corner
	    _mc.curveTo(x, y + radius - Math.tan(Math.PI/8)*radius, -Math.sin(Math.PI/4)*radius+x + radius, y + radius - Math.sin(Math.PI/4)*radius);
	    _mc.curveTo(x + radius - Math.tan(Math.PI/8)*radius, y, x + radius, y);
	    _mc.lineTo(x + ((straight_w/2)-(triangleWidth/2)) + radius, y);
	    
	    //Draw triangle
	    //_mc.lineTo(x + (straight_w/2) + radius, y-(triangleWidth/2));//Five percent height
	    _mc.lineTo(x + (straight_w/2) + radius, y-10);
	    _mc.lineTo(x + ((straight_w/2)+10) + radius, y);
	    _mc.lineTo(x + straight_w + radius, y);
	    

		//top right corner
	    _mc.curveTo(x + straight_w + radius + Math.tan(Math.PI/8)*radius, y, x + straight_w + radius + Math.sin(Math.PI/4)*radius, y + radius - Math.sin(Math.PI/4)*radius);
	    _mc.curveTo(x + width, y + radius - Math.tan(Math.PI/8)*radius, x  + width, y + radius);
	    _mc.lineTo(x + width, y + straight_h + radius);
    	if (filled) {
    		_mc.endFill();
		}  
	}	
	
}