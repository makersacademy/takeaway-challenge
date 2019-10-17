require 'customer'
require 'dishes'

describe Customer do
  it { is_expected.to respond_to :check }

  before do
    @dish = Dishes.new
  end

  it 'can select a dish from the menu' do
    subject.select(@dish.dishes["Steak"])
    expect(subject.customer_dishes).to include(6)
  end

  it 'will check the total prices on dishes they ordered' do
    subject.select(@dish.dishes["Steak"])
    subject.select(@dish.dishes["Noodles"])
    expect(subject.total_of_dishes).to eq(subject.total)
  end

#----- I HAVE OUTPUT THE TEXT MESSAGE TO THE TERMINAL -----
  it 'will place an order' do
    subject.select(@dish.dishes[1])
    subject.select(@dish.dishes[2])
    subject.place_order
    expect(subject.place_order).to eq(subject.order_msg)
  end
end
