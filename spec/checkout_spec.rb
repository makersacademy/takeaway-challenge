require 'checkout.rb'

describe Checkout do
  let(:checkout) {Checkout.new}

  it 'can add order to basket' do
    checkout.add("chicken",3)
    expect(checkout.basket).to include({:price=>3, :food=>"chicken"})
  end

  it 'can total my order' do
    checkout.add("chips", 3)
    checkout.add("salad", 2)
    puts checkout.basket
    puts checkout.total
    expect(checkout.total).to eql(5)
  end
end
