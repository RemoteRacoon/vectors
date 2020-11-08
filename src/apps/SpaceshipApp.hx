package apps;

import hxd.Cursor;
import h3d.shader.Outline;
import h3d.Vector;
import hxd.Window;
import hxd.Res;
import h2d.Bitmap;
import hxd.App;

class SpaceshipApp extends App {
	public var background(null, null):Bitmap;
	public var spaceship(null, null):Bitmap;
	public var acceleration:h3d.Vector;
	public var velocity:Vector;

	override function onResize() {
		background.width = s2d.width;
		background.height = s2d.height;
	}

	public function heading(vec:Vector) {
		return Math.atan2(vec.y, vec.x);
	}

	public function limit(vec:Vector, max:Float):h3d.Vector {
		if (vec.length() > max) {
			var v = vec.clone();
			v.normalize();
			v.scale3(max);

			return v;
		}
		return vec;
	}

	override function update(dt:Float) {
		super.update(dt);
		var mouse = new Vector(s2d.mouseX, s2d.mouseY);
		var dir = mouse.sub(new Vector(spaceship.x, spaceship.y));
		dir.normalize();

		var angle = heading(dir);

		dir.scale3(0.5);
		acceleration = dir;
		velocity = velocity.add(acceleration);
		velocity = limit(velocity, 5);
		spaceship.x += velocity.x;
		spaceship.y += velocity.y;
		spaceship.rotate(angle);
	}

	public function checkEdges() {
		if (spaceship.x > s2d.width) {
			spaceship.x = 0;
		} else if (spaceship.x < 0) {
			spaceship.x = s2d.width;
		}
		if (spaceship.y > s2d.height) {
			spaceship.y = 0;
		} else if (spaceship.y < 0) {
			spaceship.y = s2d.height;
		}
	}

	override function init() {
		super.init();
		Res.initEmbed();
		background = new Bitmap(Res.spaceship.background.toTile(), s2d);
		spaceship = new Bitmap(Res.spaceship.ship_no_engine.toTile(), s2d);
		spaceship.scale(0.2);
		spaceship.tile.dx = -spaceship.tile.width / 2;
		spaceship.tile.dy = -spaceship.tile.height / 2;
		spaceship.x = 100;
		spaceship.y = 120;
		velocity = new Vector(0, 0);
		acceleration = new Vector(0, 0);
		Window.getInstance().addResizeEvent(onResize);
	}

	public static function run() {
		new SpaceshipApp();
	}
}
