import org.papervision3d.cameras.Camera3D;
import org.papervision3d.materials.MovieAssetMaterial;
import org.papervision3d.materials.ColorMaterial;
import org.papervision3d.objects.Plane;
import org.papervision3d.scenes.Scene3D;
import org.papervision3d.core.proto.DisplayObject3D;
class Spinner extends MovieClip {
    var container : MovieClip;
    var scene : Scene3D;
    var camera: Camera3D;
    var plane : Plane;
    var material : MovieAssetMaterial;
    //var material : ColorMaterial;
    function Spinner(){
        DisplayObject3D.DEGREES = false;
        this.onEnterFrame = draw;
        
		container = this.createEmptyMovieClip( "container", 
		                    this.getNextHighestDepth() );

        container._x = 126;
        
		container._y = 130;
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
    
    function setAngle(angle){
        plane.rotationY = angle;
    }
    function setFrame(frame){
        material.movie.gotoAndStop(frame);
        material.updateBitmap();
    }
    function getCurrentFrame(){
        return material.movie._currentframe;
    }
    function draw(){
        scene.renderCamera(camera);
    }
}