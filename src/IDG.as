import Draw;
class IDG {

    static function main(root){
        var clicky = root.createEmptyMovieClip( "container", 10 )
        Draw.rectangle(clicky,0,0,900,600,0xFF0000, 0);
        
        clicky.enabled = true;
        clicky.useHandCursor = true;
        clicky.onMouseUp = function(){clicky.getURL(_level0.clickTag,"_blank")}
    }
}