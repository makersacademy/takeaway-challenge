require "basket"

describe Basket do

  it "should start with empty basket" do
    expect(subject.current_basket).to eq({})
  end

  it "recognises ability to call cart" do
    expect(subject).to respond_to(:add_to_cart)
  end

  it "can add items to basket hash" do
    subject.add_to_cart("Olives")
    expect(subject.current_basket).to include({:Olives=>2.99})
  end




end
