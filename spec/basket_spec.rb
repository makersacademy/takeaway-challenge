require 'basket'

describe Basket do

  subject(:basket) {Basket.new}
  let (:restaurant) {Restaurant.new}

  it "initialises with hash" do
    expect(basket.cart).to eq({})
  end

  it "returns error if wrong word" do
    expect{basket.add_to_basket("wine")}.to raise_error "Not on the menu!!!!!"
  end

  it "adds to basket " do
    subject.add_to_basket("chicken")
    expect(basket.cart).to include({:chicken=>10})
  end

  it "can view items and total" do
    basket.add_to_basket("chicken")
    expect(basket.view_basket).to eq({:chicken => 10})
  end

end
