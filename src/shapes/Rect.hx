package shapes;

import h2d.Scene;
import h2d.Graphics;

using Mover.PhysicsCalcs;

class Rect implements Mover {
	public var position:h3d.Vector;
	public var mass:Float;
	public var velocity:h3d.Vector;
	public var acceleration:h3d.Vector;

	private var width:Float;
	private var height:Float;

	private var parent:Scene;

	public function new(w:Float, h:Float, pos:h3d.Vector, par:Scene) {
		width = w;
		height = h;
		parent = par;
		position = pos;
	}

	// simple boundaries detection without rotation
	public function checkBoundaries():Void {
		var w = parent.width;
		var h = parent.height;
		if (position.x > w - width) {
			velocity.x *= -1;
			position.x = w - width;
		}
		if (position.x < width) {
			velocity.x *= -1;
			position.x = width;
		}
		if (position.y > h - height) {
			velocity.y *= -1;
			position.y = h - height;
		}
		if (position.y < height) {
			velocity.y *= -1;
			position.y = height;
		}
	};

	public function draw(g:Graphics):Void {
		g.beginFill(0xF0AC44);
		g.drawRect(position.x, position.y, width, height);
		g.endFill();
	};
}
