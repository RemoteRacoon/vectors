import hxd.Rand;
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
	private var movers:Array<Mover>;
	private var world:World;
	private var gravity:Gravity;
	private var wind:Wind;
	private var floating:Floating;
	private var debug:Text;

	private override function init() {
		super.init();
		initWorld();
		initAppSettings();
		initMovers();
		initDebug();
	}

	override function update(dt:Float) {
		super.update(dt);
		world.detectForce();
		s2d.dispose();
		displayDebug();
		for (m in movers) {
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
		gravity = new Gravity(0, 0.1);
		wind = new Wind(0.01, 0);
		floating = new Floating(0, -0.02);
		this.setScene(world);
	}

	public function initMovers() {
		movers = [];

		for (i in 1...20) {
			var pos = new Vector(Random.float(0, world.width), world.height / 2);
			var mass = Random.float(0.1, 2);
			var m = new Mover(pos, mass, world);
			movers.push(m);
		}
	}

	public function initAppSettings() {
		engine.backgroundColor = 0xFFFFFF;
		g = new Graphics(world);
	}

	static function main() {
		new Main();
	}
}
