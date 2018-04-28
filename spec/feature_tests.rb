# irb require './spec/feature_tests.rb'

require './lib/dishes'

def print_list
  dishes = Dishes.new
  dishes.print
end
