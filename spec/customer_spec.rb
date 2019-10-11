require 'customer'
require 'dishes'

describe Customer do
  it { is_expected.to respond_to :check }

  it 'can select a dish from the menu' do
    #Arrange
    customer = Customer.new
    dish = Dishes.new
    #Act
    customer.select(dish.dishes[1])
    #Assert
    expect(customer.customer_dishes).to include("Noodles = £3")
  end

  it 'will chack the total of dishes' do
    #Arrange
    customer = Customer.new
    dish = Dishes.new
    #Act
    customer.select(dish.dishes[1])
    customer.select(dish.dishes[2])
    #Assert
    expect(customer.amount_of_dishes).to eq(2)
  end
end
