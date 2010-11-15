import org.papervision3d.cameras.Camera3D;
import org.papervision3d.materials.MovieAssetMaterial;
import org.papervision3d.materials.ColorMaterial;
import org.papervision3d.objects.Plane;
import org.papervision3d.scenes.Scene3D;
import org.papervision3d.core.proto.DisplayObject3D;
import com.lbi.animation.single.Animation;
import com.lbi.animation.single.Pause;
import com.lbi.animation.group.Queue;
import com.lbi.animation.util.Easing;
import com.lbi.core.helper.Delegate;
class Spinner extends MovieClip {
    var container : MovieClip;
    var scene : Scene3D;
    var camera: Camera3D;
    var plane : Plane;
    var material : MovieAssetMaterial;
    var nextThresholdIndex = 0;
    var needsDisplay = true;
    var FLIP = 720;
    var THRESHOLDS : Array= [
        90,
        FLIP - 90, 
        FLIP + 90,
        2 * FLIP - 90,
        2 * FLIP + 90,
        3 * FLIP - 90
    ];
    var queue;
    function Spinner(){
        this.onEnterFrame = draw;
        init3D();
		setup();
    }
    function setContainerPosition(x,y){
        container._x = x;
		container._y = y;
    }
    function init3D(){
        container = this.createEmptyMovieClip( "container", 
		                    1 );


        scene = new Scene3D( container );
        camera = new Camera3D();
        camera.x = 0;
        camera.y = 0;
		camera.z = -800;
		camera.zoom = 1;
		camera.focus = 500;
		
		material = new MovieAssetMaterial("bubble",true);
		material.oneSide = false;
		material.smooth = true;
		//material = new ColorMaterial(0xFF0000);
		
		plane = new Plane(material,500,500,16,16);
        plane.x = 0;
        plane.y = 0;
		plane.z = 0;
        scene.push(plane);
    }
    function setup(){
        if(queue != null) queue = null;
        nextThresholdIndex = 0;
        queue = new Queue();
        var p = new Pause(60);
       // queue.addAnimation(new Animation(this,rollOn, 1, 0, 30))
        queue.addAnimation(p);
        queue.addAnimation(new Animation(this,setAngle,0, 1, 34));
        queue.addAnimation(p);
        queue.addAnimation(new Animation(this,setAngle,1, 2 ,34))
        queue.addAnimation(new Pause(300));
        queue.addAnimation(new Animation(this,setAngle,2, 3, 34));
        queue.addEventListener("complete", Delegate.create(this,reset));
        queue.go();
    }
    function reset(){
        setup();
    }
    function rollOn(n){
        n = Easing.easeInOutQuad(n);
        plane.x = -400 * n;
        plane.rotationZ = -180 * n;
        needsDisplay = true;
    }
    static function easeInOutQuad(t:Number):Number {
        var wholePart = Math.floor(t); 
        t -= wholePart;
		if ((t/=1/2) < 1) return 1/2*t*t + wholePart;
		return (-1/2 * ((--t)*(t-2) - 1)) + wholePart;
	};
    var angle;
    function setAngle(v){
        angle = FLIP * easeInOutQuad(v);
        if(angle > THRESHOLDS[nextThresholdIndex]){
            gotoNextFrame();
            nextThresholdIndex ++;
        }
        plane.rotationY = angle;
        needsDisplay = true;

    }
    function gotoNextFrame(frame){
        var frameToGoTo = (material.movie._currentframe % 6) + 1;
        material.movie.gotoAndStop(frameToGoTo);
        material.updateBitmap();
    }
    function draw(){
        if(needsDisplay){   
            scene.renderCamera(camera);
            needsDisplay = false;
        }
    }

}