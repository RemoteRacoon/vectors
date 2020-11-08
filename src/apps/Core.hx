package apps;

import shapes.Mover;
import h3d.Vector;
import hxd.res.DefaultFont;
import hxd.App;
import h2d.Text;
import h2d.Graphics;

using shapes.Mover.PhysicsCalcs;
using World.Gravity;
using World.Floating;
using World.Wind;

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

	public function applyPhysicsToMovers() {
		for (m in movers) {
			if (world.isGravity) {
				var g = new Gravity(0, 0.1 * m.mass);
				m.applyForce(g);
			}
			if (world.isFloating) {
				m.applyForce(floating);
			}
			if (world.isWind) {
				m.applyForce(wind);
			}
			if (world.isFriction) {
				m.applyForce(m.calcFriction());
			}
		}
	}

	override function update(dt:Float) {
		super.update(dt);
		s2d.dispose();
		world.detectForce();
		displayDebug();
		applyPhysicsToMovers();

		for (m in movers) {
			m.update();
			m.checkBoundaries();
			m.draw(g);
		}
	}

	public function initMovers():Void {}

	public function initAppSettings() {
		engine.backgroundColor = 0xFFFFFF;
		g = new Graphics(world);
	}

	public function initWorld() {
		world = new World();
		gravity = new Gravity(0, 0.1);
		wind = new Wind(4, 0);
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
			+ world.isFriction
			+ "\n";
	}
}
