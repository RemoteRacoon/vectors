package apps;

import h3d.Vector;
import shapes.Rect;
import h2d.Graphics;
import hxd.App;

class CollisionApp extends App {
	private var rects:Array<Rect>;
	private var world:World;
	private var g:Graphics;

	override function init() {
		super.init();
		world = new World();
		this.setScene(world);
		g = new Graphics(world);
		var w = world.width;
		var h = world.height;

		rects = [];
		for (i in 0...3) {
			var w = Random.float(30, 100);
			var h = Random.float(10, 50);
			var pos = new Vector(Random.float(0, w), Random.float(0, h));
			var r = new Rect(w, h, pos, world);
			rects.push(r);
		}
	}

	override function update(dt:Float) {
		super.update(dt);
		world.dispose();
		for (r in rects) {
			r.draw(g);
		}
	}

	public static function run() {
		new CollisionApp();
	}
}
