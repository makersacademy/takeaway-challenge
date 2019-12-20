class Menu
 # open/close principle - open to extension closed to modification
  attr_reader :dishlist
 def initialize(dishlist)
    @dishlist = dishlist
  end
  # code to print a list of dishes
end