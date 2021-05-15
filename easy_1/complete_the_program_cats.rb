=begin

Complete the Program - Cats!

Consider the following program.

Update this code so that when you run it, you see the following output:

My cat Pudding is 7 years old and has black and white fur.
My cat Butterscotch is 10 years old and has tan and white fur.

=end

class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  attr_reader :name, :age, :fur_color

  def initialize(name, age, fur_color)
    super(name, age)
    @fur_color = fur_color
  end

  def to_s
    "My cat #{self.name} is #{self.age} years old and has #{self.fur_color} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

# Further exploration
# I believe we'd be able to omit the Cat#initialize method code if we added the fur_color property to the Pet#initialize method because #initialize is automatically invoked upon object instantiation, and Ruby will use the usual class lookup order to search for that method, stopping in the Pet class when it finds it and running that #initialize method definition.

# Whether or not it's a good idea to modify Pet's class definition in this way or not depends upon the circumstances: is this class already being used elsewhere? Can we make fur_color a more generic color attribute, and make it optional so that other code doesn't now break because it's missing a third argument? Are there examples of Pet classes where having a color attribute doesn't make sense?

# In my opinion, since all pets will have some sort of color, it's not inherently illogical to add it to that class; whether it's a good idea or not from an implementation standpoint depends on how widely this Pet class has already been deployed and is in use. Changing the required number of arguments for a preexisting class can break a lot of code which depends upon that class.