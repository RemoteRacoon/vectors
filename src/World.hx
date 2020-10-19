import sys.io.FileInput;
import hxd.Key;
import format.swf.Constants.FillStyleTypeId;
import h2d.Scene;

class World extends Scene {
	public var isGravity:Bool;
	public var isWind:Bool;
	public var isFloating:Bool;

	override public function new() {
		super();
		isGravity = false;
		isWind = false;
		isFloating = false;
	}

	public function detectForce() {
		if (Key.isPressed(Key.G)) {
			this.isGravity = !isGravity;
		}
		if (Key.isPressed(Key.W)) {
			this.isWind = !isWind;
		}
		if (Key.isPressed(Key.F)) {
			this.isFloating = !isFloating;
		}
	}
}
