=begin

Reverse Engineering

Write a class that will display:

ABC
xyz

when the following code is run:

=end

class Transform
  attr_reader :data

  def self.lowercase(str)
    str.downcase
  end

  def initialize(str)
    @data = str
  end

  def uppercase
    self.data.upcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')