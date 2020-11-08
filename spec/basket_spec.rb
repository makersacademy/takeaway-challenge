require 'basket'

describe Basket do

  describe "#initialize" do
    it 'creates an empty basket' do
      expect(subject.basket).to be_empty
    end
  end

  describe "#add_to_basket" do
    it "is called on a Basket instance" do
      expect(subject).to respond_to(:add_to_basket).with(2).arguments
    end

    it 'returns a message to the user' do
      dish = 'fish'
      quantity = 2
      expect(subject.add_to_basket(dish, quantity)).to eq("#{quantity}x #{dish}(s) added to your basket.")
    end

    it 'updates the basket' do
      dish = 'fish'
      quantity = 2
      subject.add_to_basket(dish, quantity)
      expect(subject.basket).to include({dish => quantity})
    end
  end

end