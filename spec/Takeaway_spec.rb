require 'Takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  it "Instance variable has the list of dishes and prices" do
    expect(takeaway.dishes).to include("spring roll" => 0.99, "char sui bun" => 3.99,
             "pork dumpling" => 2.99, "peking duck" => 7.99,
             "fu-king fried rice" => 5.99)
  end
end

# need to create a hash that holds the food and money for each food
# then when it is initialised, that takeaway instance has the list of food on it

# method read_menu which puts out this menu to the user
# order method which asks the user to select certain food items
# they can select a food but and how many of each food item they want
# method basket_summary, which prints out the current basket of the user
# add method, which adds another food gorup to the basket
# total, which prints the total amoutn of money spent by the user.
# checkout method - checks out of store and returns value.
