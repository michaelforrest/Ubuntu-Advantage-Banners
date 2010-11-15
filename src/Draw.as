class Draw {
    static function rectangle(_mc:MovieClip, x,y,width,height, colour:Number, alpha:Number) : Void {
		if(alpha==undefined) alpha = 100;
		_mc.moveTo(x,y);
		_mc.beginFill(colour, alpha);
		_mc.lineTo(x + width, 	y);
		_mc.lineTo(x + width, 	y + height);
		_mc.lineTo(x, 	        y + height);
		_mc.endFill();
	}
}