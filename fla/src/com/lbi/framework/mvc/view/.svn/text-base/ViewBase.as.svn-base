import flash.geom.Point;import flash.geom.Rectangle;import com.lbi.animation.animator.Animator;import com.lbi.core.view.MovieClipWithEvents;/**
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
class com.lbi.framework.mvc.view.ViewBase extends MovieClipWithEvents {
	
	public var animator : Animator;
	
	function ViewBase() {
		super();
		position = new Point(_x,_y);
		animator = new Animator(this);
	}
	
	public static var POSITION : String = "position";
	private var __position:Point;
	public function get position():Point{
		return __position;
	}
	public function set position(v:Point):Void{
		setPosition(v);
	}
	public function setPosition(point:Point):ViewBase{
		_x = point.x;
		_y = point.y;
		__position = point;
		return this;
	}
	
	public function setScale ( x : Number, y : Number ) : Void
	{
		if( x == null) x = 1;
		if( y == null) y = x;
		
		_xscale = x * 100;
		_yscale = y * 100;
	}
	private var __scale:Number;
	public function get scale():Number{
		return __scale;
	}
	public function set scale(v:Number):Void{
		__scale = v;
		setScale(v);
	}
	/**
	 * because rollOut should always match releaseOutside.
	 * Just assign onRollOver directly though
	 */
	private function setRollOvers($over: Function, $out:Function): Void{
		onRollOver = $over;
		onRollOut = onReleaseOutside = $out;	
	}
	/**
	 * Handy, don't you know.
	 */
	public function bringToFront(mc : MovieClip) : Void {
		var temp:MovieClip = createEmptyMovieClip("temp", getNextHighestDepth());
		temp.swapDepths(mc);
		temp.removeMovieClip();
	}
	public function getScrollRect() : Rectangle {
		return new Rectangle(scrollRect.x, scrollRect.y, scrollRect.width,scrollRect.height);
	}
	private function scrollTo(p : Point,$width:Number,$height:Number) : Void {
		scrollRect =  new Rectangle(p.x,
									p.y,
									$width||Stage.width,
									$height||Stage.height);
	}

}