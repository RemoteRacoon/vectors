import shapes.Circle;
import shapes.Mover;
import h2d.Graphics;

class Liquid {
	public var x:Float;
	public var y:Float;
	public var width:Float;
	public var height:Float;
	public var coeff:Float = 0.07;

	public function new(x:Float, y:Float, w:Float, h:Float) {
		this.x = x;
		this.y = y;
		this.width = w;
		this.height = h;
	}

	public function display(g:Graphics) {
		g.beginFill(0x25BFF7, 0.9);
		g.drawRect(x, y, width, height);
		g.endFill();
	}

	public function calculateDrag(m:Mover):h3d.Vector {
		var speed = m.velocity.length();
		var dragMagnitude = this.coeff * speed * speed;

		var dragForce = m.velocity.clone();
		dragForce.scale3(-1);

		dragForce.normalize();
		dragForce.scale3(dragMagnitude);

		return dragForce;
	}

	public function contains(m:Mover) {
		var p = m.position;
		if (Type.getClass(m) == Circle) {
			return p.x > this.x && p.x < this.x + this.width + m.radius && p.y > this.y && p.y < this.y + this.height;
		}
		return false;
	}
}
