require './spec/support/shared_examples_for_dishes.rb'
require 'dishes.rb'

class DishesTest
  include Dishes
end

describe DishesTest do
  it_behaves_like Dishes
end
