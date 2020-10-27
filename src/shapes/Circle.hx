package shapes;

import h2d.Graphics;
import h3d.Vector;

class Circle implements Mover {
	public var position:h3d.Vector;
	public var mass:Float;
	public var velocity:h3d.Vector;
	public var radius:Float;

	public var acceleration:h3d.Vector;

	private var parent:h2d.Scene;

	public function new(position:h3d.Vector, mass:Float, radius:Float, parent:h2d.Scene) {
		this.position = position;
		this.mass = mass;
		this.radius = radius;
		this.parent = parent;
		this.velocity = new Vector(0, 0);
		this.acceleration = new Vector(0, 0);
	}

	public function checkBoundaries():Void {
		var w = parent.width;
		var h = parent.height;
		if (position.x > w - radius) {
			position.x = w - radius;
			velocity.x *= -1;
		}
		if (position.x < radius) {
			position.x = radius;
			velocity.x *= -1;
		}
		if (position.y > h - radius) {
			position.y = h - radius;
			velocity.y *= -1;
		}
		if (position.y < radius) {
			position.y = radius;
			velocity.y *= -1;
		}
	}

	public function draw(g:Graphics):Void {
		g.beginFill(0xED9309, 0.9);
		g.drawCircle(position.x, position.y, radius, 500);
		g.endFill();
	}
}
