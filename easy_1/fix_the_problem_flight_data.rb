=begin

Fix the Program - Flight Data

Consider the following class definition:

There is nothing technically incorrect about this class, but the definition may lead to problems in the future. How can this class be fixed to be resistant to future problems?

# NOTE: I changed attr_accessor to attr_reader, thinking that users of the class shouldn't be able to overwrite the database object, but the LS solution has us delete the line entirely, pointing out that implementation details such as this shouldn't be exposed to users of the class at all.

I'm a bit confused on how to know how much to expose to users of the class (which could mean an end user using an application, an outside API, or a programmer using this class in-house), but I suppose I'll learn more about this over time.
=end

class Flight
  attr_reader :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end