require "dish"

describe Dish do
  subject(:dish) { Dish.new }

  it "should be instance of class dish" do
    expect(dish).to be_instance_of Dish
  end

  it 'is to be a Hash Object' do
    MENU = { name: 'Pizza Margarita', price: '£11.99' }
    expect(MENU.is_a?(Hash)).to be_truthy
  end

  it 'print the menu list' do
    expect(dish).to respond_to(:print_dishes)
  end
end
