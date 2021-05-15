=begin
Banner Class

Behold this incomplete class for constructing boxed banners.

Complete this class so that the test cases shown below work as intended. You are free to add any methods or instance variables you need. However, do not make the implementation details public.

You may assume that the input will always fit in your terminal window.

Test Cases

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

banner = Banner.new('')
puts banner
+--+
|  |
|  |
|  |
+--+
=end

# class Banner
#   attr_reader :message

#   def initialize(message)
#     @message = message
#   end

#   def to_s
#     [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
#   end

#   private

#   def horizontal_rule
#     "+-" + ("-" * message.length) + "-+"
#   end

#   def empty_line
#     "|" + (" " * (message.length + 2)) + "|"
#   end

#   def message_line
#     "| #{@message} |"
#   end
# end

# banner = Banner.new('To boldly go where no one has gone before.')
# puts banner

# banner = Banner.new('')
# puts banner

# Further exploration: allow the passing of an optional fixed width during instantiation and center the message within that fixed width

class Banner
  DEFAULT_FIXED_WIDTH = 80

  attr_reader :message, :fixed_width, :print_width

  def initialize(message, fixed_width = nil)
    @message = message
    @fixed_width = fixed_width

    if message.length > 80 && fixed_width == nil
      @fixed_width = DEFAULT_FIXED_WIDTH
    end

    @print_width = (@fixed_width.nil? ? nil : @fixed_width - 4)
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  attr_writer :fixed_width, :print_width

  def horizontal_rule
    "+-" + ("-" * get_usable_width) + "-+"
  end

  def empty_line
    "| " + (" " * get_usable_width) + " |"
  end

  def message_line
    if self.fixed_width
      message_lines = calc_multiple_lines

      print_lines = []
      message_lines.each do |line|
        print_lines << "| #{line} |"
      end
      
      print_lines
    else
      "| #{@message} |"
    end
  end

  def get_usable_width
    usable_width = nil

    if self.fixed_width
      usable_width = self.print_width
    else
      usable_width = self.message.length
    end
    
    usable_width
  end

  def calc_multiple_lines
    message_lines = []

    if self.message.length > self.print_width
      msg_words = self.message.split

      line = ""

      msg_words.each do |word|
        if line.length + word.length + 1 < self.print_width
          line += " " + word
        else
          message_lines << line
          line = word
        end
      end

      message_lines << line
    else
      message_lines << self.message
    end
      
    message_lines.map { |line| line.center(self.print_width) }
  end
end

longer_banner = Banner.new("In sooth, I do believe this may not work. I'd very much LIKE it to work, of course, but 'tis my rough draft, and I'm ashamed to say I've used nary a PEDAC this time round the gardenia patch.", 15)
puts longer_banner

small_banner = Banner.new("This is a test.", 50)
puts small_banner

medium_banner = Banner.new("To be, or not to be, that is the question: Whether 'tis nobler in the mind to suffer the slings and arrows of outrageous fortune, or to take arms against a sea of troubles and by opposing end them.", 76)
puts medium_banner