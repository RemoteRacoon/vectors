import h2d.Graphics;
import hxd.fmt.hmd.Data.Position;
import h3d.Vector;
import h2d.Scene;
import h3d.scene.Object;

class Mover {
	public var position:h3d.Vector;
	public var radius:Float;

	private var velocity:h3d.Vector;
	private var acceleration:h3d.Vector;
	private var parent:Scene;

	public function limit(vec:h3d.Vector, value:Float) {
		if (vec.x > value || vec.y > value) {
			this.velocity.x = value;
			this.velocity.y = value;
		}
	}

	public function applyForce(force:h3d.Vector) {
		this.acceleration = this.acceleration.add(force);
	}

	public function new(position:h3d.Vector, parent:Scene) {
		this.position = new Vector(position.x, position.y);
		this.velocity = new Vector(0, 0);
		this.acceleration = new Vector(0, 0);
		this.parent = parent;
		this.radius = 10;
	}

	public function update() {
		this.velocity = this.velocity.add(this.acceleration);
		this.limit(this.velocity, 10);
		this.position = this.position.add(this.velocity);
		this.acceleration.scale3(0);
	}

	public function checkBoundaries() {
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

	public function draw(g:Graphics) {
		g.beginFill(0xF74A25);
		g.drawCircle(this.position.x, this.position.y, this.radius, 100);
		g.endFill();
	}
}
