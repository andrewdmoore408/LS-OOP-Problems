=begin

Generic Greeting (Part 1)

Modify the following code so that Hello! I'm a cat! is printed when Cat.generic_greeting is invoked.
=end

class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting

# Further exploration
# If we instantiate an instance of the class and then invoke #class on it, it's returning the class of which the object is an instance, so we can then invoke any class methods. In this example, kitty.class.generic_greeting will successfully call the class method Cat::generic_greeting

kitty = Cat.new
kitty.class.generic_greeting