class Vector extends h3d.Vector {
	public function limit(maxVel:Float) {
		if (this.x > maxVel || this.y > maxVel) {
			this.x = maxVel;
			this.y = maxVel;
		}
	}
}
