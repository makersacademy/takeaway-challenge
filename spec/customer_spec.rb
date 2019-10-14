require 'customer'
require 'dishes'

describe Customer do
  it { is_expected.to respond_to :check }

  before do
    @dish = double(:dishes)
    allow(@dish).to receive(:dishes).and_return(["Chicken = £5",
               "Noodles = £3",
               "Steak = £6"])

  end

  it 'can select a dish from the menu' do
    subject.select(@dish.dishes[1])
    expect(subject.customer_dishes).to include("Noodles = £3")
  end

  it 'will check the total of dishes' do
    subject.select(@dish.dishes[1])
    subject.select(@dish.dishes[2])
    expect(subject.amount_of_dishes).to eq(2)
  end

#----- I HAVE OUTPUT THE TEXT MESSAGE TO THE TERMINAL -----
  it 'will place an order' do
    subject.select(@dish.dishes[1])
    subject.select(@dish.dishes[2])
    subject.place_order
    expect(subject.place_order).to eq(subject.order_msg)
  end
end
