package apps;

import apps.Core.Gravity;
import shapes.Circle;
import shapes.Rect;
import shapes.Mover;
import hxd.Rand;
import hxd.res.DefaultFont;
import h2d.Text;
import h2d.Graphics;
import hxd.App;
import h3d.Vector;

using shapes.Mover.PhysicsCalcs;

class VectorApp extends Core {
	private var liquid:Liquid;

	override function initWorld() {
		super.initWorld();
		var scale = world.getScale();
		var liquidW = 500;
		var liquidH = 100;
		liquid = new Liquid(scale.x / 2 - liquidW / 2, scale.y / 1.75, liquidW, liquidH);
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
			if (liquid.contains(m)) {
				m.applyForce(liquid.calculateDrag(m));
			}
			m.update();
			m.checkBoundaries();
			m.draw(g);
		}
	}

	override function update(dt:Float) {
		super.update(dt);
		world.detectForce();
		s2d.dispose();
		liquid.display(g);
		displayDebug();
		applyPhysicsToMovers();
	}

	override function initMovers() {
		movers = [];

		for (i in 1...20) {
			var pos = new Vector(Random.float(0, world.width), world.height / 2);
			var mass = Random.float(0.3, 3);
			var m = new Circle(pos, mass, Random.float(4, 16), world);
			movers.push(m);
		}
	}

	public static function run() {
		new VectorApp();
	}
}
