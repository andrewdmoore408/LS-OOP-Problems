=begin

What Will This Do?

What will the following code print?

Prior to running the code, this is what I suspect:
puts Something.dupdata invokes the class method and will print "ByeBye". Then the instance method #dupdata is invoked and passed to puts as an argument. I believe this will output "HelloHello".

It's also possible that having both a class method and instance method with the same name will throw an error, but I don't think this is the case because the contexts of both are completely different.

  After: success! I was right!
=end

class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new
puts Something.dupdata
puts thing.dupdata