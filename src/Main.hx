import h2d.col.IBounds;
import h2d.Graphics;
import hxd.App;
import h3d.Vector;

class Main extends App {
	private var g:Graphics;
	private var m:Mover;

	private override function init() {
		super.init();
		engine.backgroundColor = 0xFFFFFF;
		g = new Graphics(s2d);
		m = new Mover(new h3d.Vector(0, 0), s2d);
	}

	override function update(dt:Float) {
		super.update(dt);
		m.update();
		m.checkBoundaries();
		g.beginFill(0xF74A25);
		g.drawCircle(m.position.x, m.position.y, m.radius, 100);
	}

	static function main() {
		new Main();
	}
}
