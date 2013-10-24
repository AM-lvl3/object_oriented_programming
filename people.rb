class Person

	def initialize(name)
		@name = name
		
	end

	def say_greeting
		greeting = "Hi, my name is "
	end

end

class Student < Person

	def learn
		"I get it!"
	end

	def say_greeting
		super + @name + "!"
	end

end

class Instructor < Person

	def teach
		"Everything in Ruby is an Object."
	end

	def say_greeting
		super
	end

end

person = Person.new("name")
student = Student.new("Cristina")
puts student.say_greeting

