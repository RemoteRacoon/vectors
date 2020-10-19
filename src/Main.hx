import hxd.res.DefaultFont;
import h2d.Text;
import h2d.Graphics;
import hxd.App;
import h3d.Vector;

typedef Gravity = Vector;
typedef Wind = Vector;
typedef Floating = Vector;

class Main extends App {
	private var g:Graphics;
	private var m:Mover;
	private var world:World;
	private var gravity:Gravity;
	private var wind:Wind;
	private var floating:Floating;
	private var debug:Text;

	private override function init() {
		super.init();
		engine.backgroundColor = 0xFFFFFF;
		initWorld();
		g = new Graphics(s2d);
		m = new Mover(new h3d.Vector(s2d.width / 2, 400), world);
		initDebug();
	}

	override function update(dt:Float) {
		super.update(dt);
		world.detectForce();
		s2d.dispose();
		displayDebug();
		if (world.isGravity) {
			m.applyForce(gravity);
		}
		if (world.isFloating) {
			m.applyForce(floating);
		}
		if (world.isWind) {
			m.applyForce(wind);
		}
		m.update();
		m.checkBoundaries();
		m.draw(g);
	}

	public function initDebug() {
		var font = DefaultFont.get();
		debug = new Text(font, world);
		debug.x = debug.y = 5;
		debug.color = new Vector(0, 0, 0, 1);
	}

	public function displayDebug() {
		debug.text = "Wind: " + world.isWind + "\nFloat: " + world.isFloating + "\nGravity: " + world.isGravity;
	}

	public function initWorld() {
		world = new World();
		gravity = new Gravity(0, 0.01);
		wind = new Wind(0.01, 0);
		floating = new Floating(0, -0.02);
		this.setScene(world);
	}

	static function main() {
		new Main();
	}
}
