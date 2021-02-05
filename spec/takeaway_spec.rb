require "takeaway"

describe Takeaway do

  before :each do
    @menu = double
    allow(@menu).to receive(:dish).with("Pizza") {[{dish: "Pizza", price: 10}]}
  end

  describe '#order' do
    it 'the takeaway can recieve a single item order' do
      expect(subject.order_dish("Pizza")).to eq @menu.dish("Pizza")
    end

    it 'the takeaway can recieve a multiple line order' do
      subject.order_dish("Pizza")
      subject.order_dish("Calzone")
      expect(subject.order).to eq [{dish: "Pizza", price: 10}, {dish: "Calzone", price: 11}]
    end
  end
  
end

# test taking a single item order

# test taking a multi line order

# test getting the price for an order

# test returning the price for an order

# test dispatching the order - sending text