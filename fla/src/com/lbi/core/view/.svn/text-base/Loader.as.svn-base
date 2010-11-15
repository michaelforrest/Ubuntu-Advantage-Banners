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
import com.lbi.animation.util.Engine;
import com.lbi.core.events.Event;
import com.lbi.core.helper.Attach;
import com.lbi.core.helper.Delegate;
import com.lbi.core.view.LoaderEvent;
import com.lbi.debug.Log;
import com.lbi.framework.mvc.view.ViewBase;
[Event("ready")]
[Event("progress")]
[Event("complete")]
[Event("complete_and_ready")]
[Event("error")]
class com.lbi.core.view.Loader extends ViewBase{
	private var __image_mc:MovieClip;
	private var loader_mcl:MovieClipLoader;
	private var image_url:String;
	private var __bytes_total : Number;
	private var __bytes_loaded : Number;
	private var __loaded : Boolean 				= false;
	private var __ready : Boolean				= false;
	private var __engine_mc : Engine;
	private var __check_init_delegate : Function;

	public function get bytes_total() : Number{
		return 	__bytes_total;
	}
	public function get bytes_loaded() : Number{
		return __bytes_loaded;	
	}

	public function get image_mc():MovieClip{
		return __image_mc;	
	}
	public static function create( $mc : MovieClip,	$depth : Number,image_url:String,x:Number, y:Number) : Loader {
		return Attach.MovieClipClass($mc,Loader, $depth, [image_url, x,y]);	
	}
	public function Loader (image_url:String, x:Number, y:Number) {
		__image_mc = createEmptyMovieClip("image"+getNextHighestDepth()+"_mc", getNextHighestDepth());
		__engine_mc = Engine.getClip();
		__check_init_delegate = Delegate.create(this, __checkInit);
		
		loader_mcl = new MovieClipLoader();
		loader_mcl.addListener(this);
		if(image_url!=undefined) load(image_url);
	}
	public function load(url:String):Void{
		this.image_url = url;
		loader_mcl.loadClip(image_url, __image_mc);
		__engine_mc.addEventListener("onEnterFrame", __check_init_delegate);
	}
	public function onLoadComplete(_mc:MovieClip) : Void {
		__loaded = true;
		dispatchEvent (new Event("complete", this));
		
		if(__ready) dispatchEvent (new Event("complete_and_ready", this));
	}
	public function onLoadProgress(mc:MovieClip,$bytesLoaded:Number,$bytesTotal:Number):Void{
		__bytes_loaded = $bytesLoaded;
		__bytes_total = $bytesTotal;
		dispatchEvent(new LoaderEvent("progress", $bytesLoaded, $bytesTotal));	
	}
	
	/*
		BAD BUG FROM MACROMEDIA, never trust corporates!
		implemented only as double check since our technique is not as
		clean as an intrinsic class would have permitted.
	*/
	public function onLoadInit(_mc:MovieClip) : Void {
		if(!__ready) __onLoadInit();
	}
	
	private function __onLoadInit ( Void ) : Void
	{
		__engine_mc.removeEventListener("onEnterFrame", __check_init_delegate);
		__ready = true;
		dispatchEvent (new Event("ready", this));
		
		if(__loaded) dispatchEvent (new Event("complete_and_ready"));
	}
	
	private function __checkInit ( Void ) : Void
	{
		if(__image_mc._framesloaded > 1) __onLoadInit();
	}
	
	private function onLoadError (errorCode:String, httpStatus:Number) : Void {
		Log.error("error loading \""+  image_url+"\" : " + httpStatus);
		dispatchEvent(new Event("error", this));
	}
	public function getFileName():String{
		return image_url;	
	}

}