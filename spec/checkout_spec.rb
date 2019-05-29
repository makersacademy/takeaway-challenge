require 'checkout.rb'
require 'takeaway.rb'

describe Checkout do
  let(:checkout) {Checkout.new}
  let(:takeaway) {Takeaway.new}

  it 'can add order to basket' do
    checkout.add("chicken", 5)
    expect(checkout.basket).to include({:price=>5, :food=>"chicken"})
  end

  it 'can total my order' do
    checkout.add("chicken", 5)
    checkout.add("bread", 3)
    puts checkout.basket
    puts checkout.total
    expect(checkout.total).to eql(8)
  end

  it 'will raise an error if item is not on the menu' do
    expect(checkout.add("chicken",5)).to raise_error "sorry item is not listed on the menu!"
  end

end
