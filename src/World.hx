import h3d.Vector;
import sys.io.FileInput;
import hxd.Key;
import format.swf.Constants.FillStyleTypeId;
import h2d.Scene;

class World extends Scene {
	public var isGravity:Bool;
	public var isWind:Bool;
	public var isFloating:Bool;
	public var isFriction:Bool;

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
	}
}
