# irb require './spec/feature_tests.rb'

require './lib/dishes'

def print_list
  dishes = Dishes.new
  p dishes.list
end
