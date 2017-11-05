require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:menu) { [{ name: 'burger', price: 5 }] }
  let(:new_order) { [{ name: 'burger', price: 5 }, { name: 'burger', price: 5 }] }

  describe '#add_dish' do
    it "should add order to order array" do
      order.add_dish('burger', 2)
      expect(order.order).to eq new_order
    end

    it "should raise an error if dish not on menu" do
      error = "Please check your dish is on the menu"
      expect { order.add_dish('burrrger', 2) }.to raise_error error
    end
  end

  describe '#total' do
    it "should give the total of the order" do
      order.add_dish('burger', 2)
      expect(order.total).to eq 10
    end
  end
end
