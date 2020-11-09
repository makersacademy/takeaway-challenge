require 'basket'

describe Basket do

  describe "#initialize" do
    it 'creates an empty basket' do
      expect(subject.basket).to be_empty
    end

    it 'creates a basket_val variable equal to zero' do
      expect(subject.basket_val).to eq(0)
    end
  end

  describe "#add_to_basket" do
    it "is called on a Basket instance" do
      expect(subject).to respond_to(:add_to_basket).with(3).arguments
    end

    it 'returns a message to the user' do
      dish = 'fish'
      quantity = 2
      price = 7
      expect(subject.add_to_basket(dish, quantity, price)).to eq("#{quantity}x #{dish}(s) added to your basket.")
    end

    it 'updates the basket' do
      dish = 'fish'
      quantity = 2
      price = 7
      subject.add_to_basket(dish, quantity, price)
      expect(subject.basket).to include({dish => [quantity, quantity * price]})
    end
  end

  describe "#summary" do
    it 'is called on a Basket instance' do
      expect(subject).to respond_to(:summary)
    end

    it 'prints out to stdout' do
      subject.add_to_basket('fish', 4, 7)
      expect { subject.summary }.to output.to_stdout
    end
  end

  describe "#total_value" do
    it 'is called on a Basket instance' do
      expect(subject).to respond_to(:total_value)
    end

    it 'returns the basket\'s value' do
      expect(subject.total_value).to eq(subject.basket_val)
    end
  end

end