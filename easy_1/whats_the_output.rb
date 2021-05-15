=begin
What's the Output?

Take a look at the following code:

What output does this code print? Fix this class so that there are no surprises waiting in store for the unsuspecting developer.

=end

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

# name = 'Fluffy'
# fluffy = Pet.new(name)
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name

# Further exploration
name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

# This code works as it does because the instance variable @name and local variable (local outside the class) name variables end up pointing to different things. The call to #to_s in the constructor method returns a new object—a string—instead of binding @name to the same object that local variable name points to, so when local variable name is modified, it doesn't affect the state of fluffy's name.