=begin

Fix The Program - Expander

What is wrong with the following code? What fix(es) would you make?

One issue is that #expand explicitly references an ivar; I've added a getter for that data and used it instead in #expand.

This code also depends upon a string being passed to it, so it would act very differently if it's initialized with another type of object. I invoked #to_s in the initialize method to ensure that the result of calling #expand (which is called by #to_s) will be displaying a string multiple times rather than something like arithmetic multiplication or throwing an error.

Another issue is the hardcoding of the number 3. I've added an optional parameter defaulting to an ivar (which can be set and gotten publicly) to #to_s to make the code more flexible
=end

class Expander
  attr_reader :string
  attr_accessor :num_repeats

  def initialize(data)
    @string = data.to_s
    @num_repeats = 5
  end

  def to_s(n = num_repeats)
    self.expand(n)
  end

  private

  def expand(n)
    self.string * n
  end
end

expander = Expander.new('xyz')
puts expander