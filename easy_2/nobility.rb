=begin

Nobility

Now that we have a Walkable module, we are given a new challenge. Apparently some of our users are nobility, and the regular way of walking simply isn't good enough. Nobility need to strut.

We need a new class Noble that shows the title and name when walk is called:

We must have access to both name and title because they are needed for other purposes that we aren't showing here.

=end

module Walkable
  def walk
    puts "#{self.name} #{self.gait} forward"
  end
end

class Person
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Noble < Person
  attr_reader :title

  def initialize(name, title)
    super(name)
    @title = title
  end

  def gait
    "struts"
  end

  def walk
    puts "#{self.title} #{self.name} #{self.gait} forward"
  end
end

byron = Noble.new("Byron", "Lord")
p byron.walk
# => "Lord Byron struts forward"


puts byron.name
#=> "Byron"
puts byron.title
#=> "Lord"
