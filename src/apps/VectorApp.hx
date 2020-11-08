package apps;

import apps.Core.Gravity;
import shapes.Circle;
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

	override function applyPhysicsToMovers() {
		super.applyPhysicsToMovers();

		for (m in movers) {
			if (liquid.contains(m)) {
				m.applyForce(liquid.calculateDrag(m));
			}
		}
	}

	override function update(dt:Float) {
		super.update(dt);
		liquid.display(g);
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
