require "basket"

describe Basket do

  subject(:basket) {described_class.new}

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

  it "returns error where selected dish is not valid" do
    expect{subject.add_to_cart(:potato)}.to raise_error "Item not on menu"
  end

  it "should return contents of basket" do
    basket.add_to_cart("Olives")
    expect(basket.current_basket).to eq({:Olives=>2.99})
  end

  it "reesponds to basket status" do
    expect(basket).to respond_to(:basket_status)
  end

end
