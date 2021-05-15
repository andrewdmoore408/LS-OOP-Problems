=begin

Pet Shelter

Consider the following code

Write the classes and methods that will be necessary to make this code run, and print the following output:

P Hanson has adopted the following pets:
a cat named Butterscotch
a cat named Pudding
a bearded dragon named Darwin

B Holmes has adopted the following pets:
a dog named Molly
a parakeet named Sweetie Pie
a dog named Kennedy
a fish named Chester

P Hanson has 3 adopted pets.
B Holmes has 4 adopted pets.

The order of the output does not matter, so long as all of the information is presented.

=end

class Pet
  attr_reader :type, :name

  def initialize(type, name)
    @type = type
    @name = name
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    self.pets = []
  end

  def add_pet(new_pet)
    self.pets << new_pet
  end

  def number_of_pets
    self.pets.length
  end

  private

  attr_writer :pets
end

class Shelter

  def initialize
    @adoption_owners = {}
  end

  def adopt(owner, pet)
    owner.add_pet(pet)

    if self.adoption_owners.key?(owner)
      self.adoption_owners[owner] << pet
    else
      self.adoption_owners[owner] = [pet]
    end
  end

  def print_adoptions
    self.adoption_owners.each do |owner, pets|
      puts "#{owner.name} has adopted the following pets: "
      pets.each do |pet|
        puts "a #{pet.type} named #{pet.name}"
      end
    end
  end

  private
  attr_accessor :adoption_owners
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."