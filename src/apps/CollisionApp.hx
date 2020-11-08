package apps;

import h3d.Vector;
import shapes.Rect;

using shapes.Mover.PhysicsCalcs;

class CollisionApp extends Core {
	override function initMovers() {
		movers = [];
		for (i in 0...10) {
			var w = Random.float(30, 100);
			var h = Random.float(10, 50);
			var pos = new Vector(Random.float(0, world.width), Random.float(0, world.height));
			var r = new Rect(w, h, pos, world);
			movers.push(r);
		}
	}

	public static function run() {
		new CollisionApp();
	}
}
