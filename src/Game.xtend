import com.ardor3d.scenegraph.Mesh
import com.ardor3d.scenegraph.shape.Box
import com.ardor3d.math.Vector3
import com.ardor3d.bounding.BoundingBox
import com.ardor3d.renderer.state.TextureState
import com.ardor3d.util.TextureManager
import com.ardor3d.image.Texture
import com.ardor3d.renderer.state.MaterialState
import com.ardor3d.renderer.state.MaterialState$ColorMaterial

class Game extends ExampleBase {
	Mesh box = null
	
	def static void main(String[] args) {
		start(typeof(Game));
	}
	
	override void initExample() {
		_canvas.setTitle("Prototype 1 racing game")
		
		box = new Box("Box", new Vector3(0, 0, 0), 5, 5, 5);
		box.setModelBound(new BoundingBox());
		box.setTranslation(new Vector3(0, 0, -15));
		box.setRandomColors();
		
		_root.attachChild(box);
		
		val ts = new TextureState();
		ts.setTexture(TextureManager::load("images/ardor3d_white_256.jpg", Texture$MinificationFilter::Trilinear, true));
		box.setRenderState(ts);
		
		val ms = new MaterialState();
		ms.setColorMaterial(ColorMaterial::Diffuse);
		box.setRenderState(ms);
	}
}