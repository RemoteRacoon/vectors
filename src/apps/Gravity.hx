package apps;

import shapes.Rect;
import h3d.Vector;

using shapes.Mover.PhysicsCalcs;

class Gravity extends Core {
	override function initMovers() {
		movers = [];
		for (i in 0...2) {
			var w = Random.float(30, 100);
			var h = Random.float(10, 50);
			var pos = new Vector(Random.float(0, world.width), Random.float(0, world.height));
			var r = new Rect(w, h, pos, world);
			movers.push(r);
		}
	}

	override function applyPhysicsToMovers() {
		super.applyPhysicsToMovers();
		if (world.isAttraction) {
			for (i in 0...movers.length) {
				for (j in 0...movers.length) {
					if (i != j) {
						movers[j].attract(movers[i]);
					}
				}
			}
		}
	}

	override function displayDebug() {
		super.displayDebug();
		debug.text += "Attraction :" + world.isAttraction + "\n";
	}

	public static function run() {
		new Gravity();
	}
}
