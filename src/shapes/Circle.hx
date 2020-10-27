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

	public function checkBoundaries():Void {}

	public function draw(g:Graphics):Void {}
}
