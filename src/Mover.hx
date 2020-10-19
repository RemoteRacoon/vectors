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

	public function new(position:h3d.Vector, parent:Scene) {
		this.position = new Vector(position.x, position.y);
		this.velocity = new Vector(0, 0);
		this.acceleration = new Vector(-0.001, 0.01);
		this.parent = parent;
		this.radius = 10;
	}

	public function update() {
		this.velocity = this.velocity.add(this.acceleration);
		this.limit(this.velocity, 10);
		this.position = this.position.add(this.velocity);
	}

	public function checkBoundaries() {
		if (position.x + radius > parent.width || position.x - radius < 0) {
			velocity.x *= -1;
		}
		if (position.y + radius > parent.height || position.y - radius < 0) {
			velocity.y *= -1;
		}
	}
}
