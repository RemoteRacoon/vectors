import h3d.Vector;
import hxd.Key;
import h2d.Scene;

typedef Gravity = h3d.Vector;
typedef Wind = h3d.Vector;
typedef Floating = h3d.Vector;

class World extends Scene {
	public var isGravity:Bool;
	public var isWind:Bool;
	public var isFloating:Bool;
	public var isFriction:Bool;
	public var isAttraction:Bool;

	override public function new() {
		super();
		isGravity = false;
		isWind = false;
		isFloating = false;
		isFriction = false;
	}

	public function getScale():Vector {
		return new Vector(this.width, this.height);
	}

	public function detectForce() {
		if (Key.isPressed(Key.G)) {
			this.isGravity = !isGravity;
			return;
		}
		if (Key.isPressed(Key.W)) {
			this.isWind = !isWind;
			return;
		}
		if (Key.isPressed(Key.F)) {
			this.isFloating = !isFloating;
			return;
		}
		if (Key.isPressed(Key.R)) {
			this.isFriction = !this.isFriction;
		}
		if (Key.isPressed(Key.A)) {
			this.isAttraction = !this.isAttraction;
		}
	}
}
