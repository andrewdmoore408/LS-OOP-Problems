=begin

Fix the Program - Books (Part 2)

Complete this program so that it produces the expected output:

Expected output:

The author of "Snow Crash" is Neil Stephenson.
book = "Snow Crash", by Neil Stephenson.
=end

class Book
  attr_accessor :author, :title

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

# Further exploration
# One potential problem with separating the steps of state object creation and initialization is the possibility that the state will be needed but is currently nil. This isn't the case in the above code but could lead to an issue.