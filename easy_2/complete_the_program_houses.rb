=begin

Complete The Program - Houses

Assume you have the following code:

and this output:

Home 1 is cheaper
Home 2 is more expensive

Modify the House class so that the above program will work. You are permitted to define only one new method in House.
=end

class House
  include Comparable

  attr_reader :price

  def initialize(price)
    @price = price
  end

  def <=> (other_home)
    self.price <=> other_home.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1

# Further exploration
# I think the issue with comparing houses this way is that we're only able to define one metric for comparison here. Price is an important attribute of housing, but there are many other important traits for housing as well, such as type of house (single-family home? duplex? is there a yard?); square footage (or meters in on the metric system); number of bedrooms/bathrooms, number of stories, whether there's a garage and/or on-street reserved parking available; number of schools and businesses nearby; urban/sub(or ex-)urban/rural; transit nearby; parks nearby; required down payment/financing...

# If it's possible to implement Comparable in a way where additional comparisons such as the above can be defined (maybe just having #<=> return an array of two hashes with all the above attributes listed for both houses and whichever one is "greater than" on more attributes is sorted to be higher?) then that may be a good approach, but off the top of my head I don't think this is a constructive use of Comparable.

# Lots of classes may find great use in Comparable. I think the issue with something as complex as a House is the number of dimensions along which it can be measured and the fact that preferences will vary. A family with kids may want the highest number of nearby schools possible, whereas perhaps a child-free individual/couple would prefer not to live near any if they can help it.