### VARIABLES, COMMENTS, AND IN-/OUTPUT ###################################
my_var = "Hello world"


# Output variable with and without line break after
print my_var
puts my_var

#A single line comment

=begin
A multi line comment...
...
=end


### SELECTION


### CLASSES #################################





#-- Standard constructor -------------
# require "pretty"
class Person
  attr_accessor :name, :birth_year

  def initialize(args = {})
    options = { :name => "Unknown", :birth_year => 1901 }.merge(args)

    self.name = options[:name]
    self.birth_year = options[:birth_year]
  end
end

bjorn = Person.new(name: "Björn", birth_year: 1970)

p bjorn
