import com.lbi.core.helper.Delegate;
import com.lbi.debug.Log;
import com.lbi.helpers.view.SimpleDrawing;
/**
 * @author micfor
 */
class com.lbi.debug.DraggyClip {
	public static function initialize(mc:MovieClip):Void{
		mc.onPress = Delegate.create(DraggyClip, _onPress, [mc]);		
		mc.onRelease = Delegate.create(DraggyClip, _onRelease, [mc]);
		mc.onKeyDown = Delegate.create(DraggyClip, _onKeyPress, [mc]);
		mc.onRollOver = Delegate.create(DraggyClip, _addKeyListener, [mc]);
		mc.onRollOut = Delegate.create(DraggyClip, _removeKeyListener, [mc]);
	}
	public static function _addKeyListener(mc:MovieClip):Void{
		Key.addListener(mc);
		//mc._alpha = 80;
		SimpleDrawing.outline( mc, 0xFF0000);
	}
	public static function _removeKeyListener(mc:MovieClip):Void{
		mc.clear();
		Key.removeListener(mc);
	}
	public static function _onPress(mc:MovieClip):Void{
		
		mc.startDrag();
		mc["__dragging"] = true;
	}
	public static function _onRelease(mc:MovieClip):Void{
		mc["__dragging"] = false;
		mc.stopDrag();
		delete mc.onEnterFrame;
	}
	public static function _onKeyPress(mc:MovieClip):Void{
		// = (equals) key
		if(Key.getAscii()==0x3D){
			mc._xscale = mc._yscale = mc._xscale + 5;
		}
		// - (minus) key
		if(Key.getAscii()==0x2d){
			mc._xscale = mc._yscale = mc._xscale - 5;
		}
		// _ (shift + minus) key
		if(Key.getAscii()==0x2b){
			mc._xscale = mc._yscale = mc._xscale + .5;
		}
		// + (shift + plus) key
		if(Key.getAscii()==0x5F){
			mc._xscale = mc._yscale = mc._xscale - .5;
		}
		// p ("print") key
		if(Key.getAscii()==0x70){
			Log.info("Point(" + Math.round(mc._x) + ", " + Math.round(mc._y) +"), scale=" + mc._xscale + "("+  mc + ")");
		}
		// t ("transparent") key
		if(Key.getAscii()==0x74){
			mc._alpha = 50;
		}
		// T ("untransparent") key
		if(Key.getAscii()==0x54){
			mc._alpha = 100;
		}
		var increment:Number = 1;
		if(Key.isDown(Key.CONTROL)){
			increment = 10;
		}
		if(Key.isDown(Key.LEFT)){

			mc._x -= increment;
		}
		if(Key.isDown(Key.RIGHT)){
			mc._x += increment;
		}
		if(Key.isDown(Key.UP)){
			mc._y -= increment;
		}
		if(Key.isDown(Key.DOWN)){
			mc._y += increment;
		}
		
	}
}