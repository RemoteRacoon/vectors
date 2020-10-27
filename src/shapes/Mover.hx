package shapes;

import h2d.Graphics;
import hxd.fmt.hmd.Data.Position;
import h3d.Vector;
import h2d.Scene;

using Mover.PhysicsCalcs;

@:allow(PhysicsCalcs)
interface Mover {
	public var position:h3d.Vector;
	public var mass:Float;
	public var velocity:h3d.Vector;
	public var acceleration:h3d.Vector;
	private var parent:Scene;
	public function checkBoundaries():Void;
	public function draw(g:Graphics):Void;
}

class PhysicsCalcs {
	public static function calcFriction(m:Mover):h3d.Vector {
		var c = 0.008; // coefficient of friction
		var normal = 1; // normal force (this simpliest case is mg if it's collinear to the gravity vector)
		var frictionMag = c * normal;
		var friction = m.velocity.clone();
		friction.scale3(-1);
		friction.getNormalized();
		friction.scale3(frictionMag);
		return friction;
	}

	public static function applyForce(m:Mover, force:h3d.Vector):Void {
		force.scale3(1.0 / m.mass);
		m.acceleration = m.acceleration.add(force);
	}

	public static function update(m:Mover):Void {
		m.velocity = m.velocity.add(m.acceleration);
		m.limit(m.velocity, 10);
		m.position = m.position.add(m.velocity);
		m.acceleration.scale3(0);
	}

	public static function limit(m:Mover, vec:h3d.Vector, value:Float) {
		if (vec.x > value || vec.y > value) {
			m.velocity.x = value;
			m.velocity.y = value;
		}
	}
}
