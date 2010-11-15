import com.lbi.debug.Log;

import flash.display.BitmapData;
/**
 * @author micfor
 */
class com.lbi.core.helper.Library
{
	public static function getFillData(linkage_id:String) : BitmapData {
		var b:BitmapData = new BitmapData(14,14,true,0x00000000);
		var l:MovieClip = _root.attachMovie(linkage_id,"mc", _root.getNextHighestDepth());
		b.draw(l); 
		l.removeMovieClip();
		return b;
	}
	
	public static function attachMovieClip( linkage_id : String, parent : MovieClip, depth : Number ) : MovieClip
	{
		if(parent == null) Log.error("Error: Library::attachMovieClip, parent is null!");
		if(depth == null) depth = parent.getNextHighestDepth();
		var mc : MovieClip = parent.attachMovie(linkage_id, linkage_id + "_" + depth, depth);
		if(mc == null) Log.error("Error: Librarysymbol::attachMovieClip, symbol with id " + linkage_id + " not found!");
		return mc;
	}
	public static function getSymbolHeight(linkage_id : String) : Number
	{
		var mc : MovieClip = attachMovieClip(linkage_id, _root);
		var res : Number = mc._height;
		mc.removeMovieClip();
		return res;
	}
	public static function getSymbolWidth(linkage_id : String) : Number
	{
		var mc : MovieClip = attachMovieClip(linkage_id, _root);
		var res : Number = mc._width;
		mc.removeMovieClip();
		return res;
	}

}