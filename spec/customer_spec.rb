require 'customer'
require 'dishes'

describe Customer do
  it { is_expected.to respond_to :check }

  before do
    @customer = Customer.new
    @dish = Dishes.new
  end

  it 'can select a dish from the menu' do
    @customer.select(@dish.dishes[1])
    expect(@customer.customer_dishes).to include("Noodles = £3")
  end

  it 'will check the total of dishes' do
    @customer.select(@dish.dishes[1])
    @customer.select(@dish.dishes[2])
    expect(@customer.amount_of_dishes).to eq(2)
  end

#----- I HAVE OUTPUT THE TEXT MESSAGE TO THE TERMINAL -----
  it 'will place an order' do
    @customer.select(@dish.dishes[1])
    @customer.select(@dish.dishes[2])
    @customer.place_order
    expect(@customer.place_order).to eq(@customer.order_msg)
  end


end
