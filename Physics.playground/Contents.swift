//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

struct Vector: CustomStringConvertible {
	var x: Double
	var y: Double
	var length: Double {
		return sqrt(x*x + y*y)
	}
	var angle: Double {
		return atan2(y, x)
	}
	var description: String {
		return "(\(x), \(y))"
	}

	init() {
		self.init(x: 0, y: 0)
	}

	init(x: Double, y: Double) {
		self.x = x
		self.y = y
	}

	func vectorByAdding(vector vector: Vector) -> Vector {
		return Vector(x: x + vector.x, y: y + vector.y)
	}
}

let gravity = Vector(x: 0.0, y: -9.8)
print(gravity)

func +(left: Vector, right: Vector) -> Vector {
	return left.vectorByAdding(vector: right)
}

func *(left: Vector, right: Double) -> Vector {
	return Vector(x: left.x * right, y: left.y * right)
}

class Particle {
	var position: Vector
	var velocity: Vector
	var acceleration: Vector

	init(position: Vector) {
		self.position = position
		self.velocity = Vector()
		self.acceleration = Vector()
	}

	convenience init() {
		self.init(position: Vector())
	}


	func tick(dt: NSTimeInterval) {
		velocity = velocity + acceleration * dt
		position = position + velocity * dt
		position.y = max(0, position.y)
	}
}

class Simulation {
	var particles: [Particle] = []
	var time: NSTimeInterval = 0.0


	func addParticle(particle: Particle) {
		particles.append(particle)
	}

	func tick(dt: NSTimeInterval) {
		for particle in particles {
			particle.acceleration = particle.acceleration + gravity
			particle.tick(dt)
			particle.acceleration = Vector()
			particle.position.y
		}
		time += dt
		particles.filter { particle in
			let live = particle.position.y > 0.0

			if !live {
				print("Particle terminated at ", self.time)
				return live
			}

			return live
		}
	}
}

let simulation = Simulation()

let ball = Particle()
ball.acceleration = Vector(x: 0, y: 100)

simulation.addParticle(ball)

while simulation.particles.count > 0 && simulation.time < 500 {
	simulation.tick(1.0)
}
















