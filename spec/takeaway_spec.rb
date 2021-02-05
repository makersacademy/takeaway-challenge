require "takeaway"

describe Takeaway do
  before :each do
    @menu = double
    allow(@menu).to receive(:dish).with("Pizza") { [{ name: "Pizza", price: 10 }] }
  end

  describe '#menu' do
    it 'gets the full menu' do
      expect(subject.menu).to eq subject.menu
    end
  end

  describe '#order' do
    it 'can recieve a single item order' do
      expect(subject.order_dish("Pizza")).to eq @menu.dish("Pizza")
    end

    it 'can recieve a multiple line order' do
      subject.order_dish("Pizza")
      subject.order_dish("Calzone")
      expect(subject.order).to eq [{ name: "Pizza", price: 10 }, { name: "Calzone", price: 11 }]
    end

    it 'can add multiple of a single dish' do
      subject.order_dish(2, "Pizza")
      expect(subject.order).to eq [{ name: "Pizza", price: 10 }, { name: "Pizza", price: 10 }]
    end

    it 'wont add items that are not in the menu, returns an error' do
      expect { subject.order_dish("Curry") }.to raise_error 'Sorry, that item is not on the menu'
    end
  end
  
  describe '#complete_order' do
    it 'completes the order and gets the total price' do
      subject.order_dish("Pizza")
      expect(subject.complete_order).to eq "The total cost is £10"
    end

    it 'gets a price for a multiple line order' do
      subject.order_dish(4, "Pizza")
      expect(subject.complete_order).to eq "The total cost is £40"
    end
  end
end
