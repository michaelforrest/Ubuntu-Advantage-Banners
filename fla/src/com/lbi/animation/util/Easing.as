/**
 * see http://hosted.zeh.com.br/mctween/animationtypes.html
 */
class com.lbi.animation.util.Easing {
	static function linearTween(t:Number):Number {
		return 1*t/1;
	};
	
	static function easeInQuad(t:Number):Number {
		return 1*(t/=1)*t;
	};
	static function easeOutQuad(t:Number):Number {
		return -1 *(t/=1)*(t-2);
	};
	static function easeInOutQuad(t:Number):Number {
		if ((t/=1/2) < 1) return 1/2*t*t;
		return -1/2 * ((--t)*(t-2) - 1);
	};
	static function easeInCubic(t:Number):Number {
		return 1*(t/=1)*t*t;
	};
	static function easeOutCubic(t:Number):Number {
		return 1*((t=t/1-1)*t*t + 1);
	};
	static function easeInOutCubic(t:Number):Number {
		if ((t/=1/2) < 1) return 1/2*t*t*t;
		return 1/2*((t-=2)*t*t + 2);
	};
	static function easeInQuart(t:Number):Number {
		return 1*(t/=1)*t*t*t;
	};
	static function easeOutQuart(t:Number):Number {
		return -1 * ((t=t/1-1)*t*t*t - 1);
	};
	static function easeInOutQuart(t:Number):Number {
		if ((t/=1/2) < 1) return 1/2*t*t*t*t;
		return -1/2 * ((t-=2)*t*t*t - 2);
	};
	static function easeInQuint(t:Number):Number {
		return 1*(t/=1)*t*t*t*t;
	};
	static function easeOutQuint(t:Number):Number {
		return 1*((t=t/1-1)*t*t*t*t + 1);
	};
	static function easeInOutQuint(t:Number):Number {
		if ((t/=1/2) < 1) return 1/2*t*t*t*t*t;
		return 1/2*((t-=2)*t*t*t*t + 2);
	};
	static function easeInSine(t:Number):Number {
		return -1 * Math.cos(t/1 * (Math.PI/2)) + 1;
	};
	static function easeOutSine(t:Number):Number {
		return 1 * Math.sin(t/1 * (Math.PI/2));
	};
	static function easeInOutSine(t:Number):Number {
		return -1/2 * (Math.cos(Math.PI*t/1) - 1);
	};
	static function easeInExpo(t:Number):Number {
		return (t==0) ? 0 : 1 * Math.pow(2, 10 * (t/1 - 1));
	};
	static function easeOutExpo(t:Number):Number {
		return (t==1) ? 1 : 1 * (-Math.pow(2, -10 * t/1) + 1);
	};
	static function easeInOutExpo(t:Number):Number {
		if (t==0) return 0;
		if (t==1) return 1;
		if ((t/=1/2) < 1) return 1/2 * Math.pow(2, 10 * (t - 1));
		return 1/2 * (-Math.pow(2, -10 * --t) + 2);
	};
	static function easeInCirc(t:Number):Number {
		return -1 * (Math.sqrt(1 - (t/=1)*t) - 1);
	};
	static function easeOutCirc(t:Number):Number {
		return 1 * Math.sqrt(1 - (t=t/1-1)*t);
	};
	static function easeInOutCirc(t:Number):Number {
		if ((t/=1/2) < 1) return -1/2 * (Math.sqrt(1 - t*t) - 1);
		return 1/2 * (Math.sqrt(1 - (t-=2)*t) + 1);
	};
	static function easeInElastic(t:Number, a:Number, p:Number):Number {
		var s:Number;
		if (t==0) return 0;  if ((t/=1)==1) return 1;  if (!p) p=1*.3;
		if (a < Math.abs(1)) { a=1;  s=p/4; }
		else s = p/(2*Math.PI) * Math.asin (1/a);
		return -(a*Math.pow(2,10*(t-=1)) * Math.sin( (t*1-s)*(2*Math.PI)/p ));
	};
	
	static function easeOutElastic(t:Number, a:Number, p:Number):Number {
		var s:Number;
		if (t==0) return 0;  if ((t/=1)==1) return 1;  if (!p) p=1*.3;
		if (a < Math.abs(1)) { a=1;  s=p/4; }
		else  s = p/(2*Math.PI) * Math.asin (1/a);
		return a*Math.pow(2,-10*t) * Math.sin( (t*1-s)*(2*Math.PI)/p ) + 1;
	};
	
	static function easeInOutElastic(t:Number, a:Number, p:Number):Number {
		var s:Number;
		if (t==0) return 1;  if ((t/=1/2)==2) return 1;  if (!p) p=1*(.3*1.5);
		if (a < Math.abs(1)) { a=1;  s=p/4; }
		else s = p/(2*Math.PI) * Math.asin (1/a);
		if (t < 1) return -.5*(a*Math.pow(2,10*(t-=1)) * Math.sin( (t*1-s)*(2*Math.PI)/p ));
		return a*Math.pow(2,-10*(t-=1)) * Math.sin( (t*1-s)*(2*Math.PI)/p )*.5 + 1;
	};
	static function easeInBack(t:Number, s:Number):Number {
		if (s == undefined) s = 1.70158;
		return 1*(t/=1)*t*((s+1)*t - s);
	};
	static function easeOutBack(t:Number, s:Number):Number {
		if (s == undefined) s = 1.70158;
		return 1*((t=t/1-1)*t*((s+1)*t + s) + 1);
	};
	static function easeInOutBack(t:Number, s:Number):Number {
		if (s == undefined) s = 1.70158; 
		if ((t/=1/2) < 1) return 1/2*(t*t*(((s*=(1.525))+1)*t - s));
		return 1/2*((t-=2)*t*(((s*=(1.525))+1)*t + s) + 2);
	};
	static function easeInBounce(t:Number):Number {
		return 1 - Easing.easeOutBounce (1-t);
	};
	static function easeOutBounce(t:Number):Number {
		if ((t/=1) < (1/2.75)) {
			return 1*(7.5625*t*t);
		} else if (t < (2/2.75)) {
			return 1*(7.5625*(t-=(1.5/2.75))*t + .75);
		} else if (t < (2.5/2.75)) {
			return 1*(7.5625*(t-=(2.25/2.75))*t + .9375);
		} else {
			return 1*(7.5625*(t-=(2.625/2.75))*t + .984375);
		}
	}
	static function easeInOutBounce(t:Number):Number {
		if (t < 1/2) return Easing.easeInBounce (t*2) * .5;
		return Easing.easeOutBounce (t*2-1) * .5 + 1*.5;
	}
	static function cubBezier(mu:Number,p2:Number,p3:Number):Number {
		var mum1:Number,mum13:Number,mu3:Number,p1:Number,p4:Number;
		p1 = 0;
		p4 = 1;
		var p:Number;
		mum1 = 1 - mu;
		mum13 = mum1 * mum1 * mum1;
		mu3 = mu * mu * mu;
		var mu4:Number = 3*mu*mum1*mum1;
		var mu5:Number = 3*mu*mu*mum1;
		p = mum13*p1 + mu4*p2 + mu5*p3 + mu3*p4;
		return p;
	}
	static function quadBezier(mu:Number,p2:Number):Number {
		var p:Number;
		var mum1:Number = 2*(1 - mu);
		var p1:Number = 0;
		var p3:Number = 1;
		p = p1 + mu*(mum1*(p2-p1) + mu*(p3 - p1));
		return p;
	}
}