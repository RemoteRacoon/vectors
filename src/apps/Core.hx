package apps;

import shapes.Mover;
import h3d.Vector;
import hxd.res.DefaultFont;
import hxd.App;
import h2d.Text;
import h2d.Graphics;

typedef Gravity = h3d.Vector;
typedef Wind = h3d.Vector;
typedef Floating = h3d.Vector;

class Core extends App {
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
		initDebug();
		initMovers();
	}

	public function initMovers():Void {}

	public function initAppSettings() {
		engine.backgroundColor = 0xFFFFFF;
		g = new Graphics(world);
	}

	public function initWorld() {
		world = new World();
		gravity = new Gravity(0, 0.1);
		wind = new Wind(0.01, 0);
		floating = new Floating(0, -0.02);
		this.setScene(world);
	}

	public function initDebug() {
		var font = DefaultFont.get();
		debug = new Text(font, world);
		debug.x = debug.y = 5;
		debug.color = new Vector(0, 0, 0, 1);
	}

	public function displayDebug() {
		debug.text = "Wind: "
			+ world.isWind
			+ "\nFloat: "
			+ world.isFloating
			+ "\nGravity: "
			+ world.isGravity
			+ "\nFriction: "
			+ world.isFriction;
	}
}
