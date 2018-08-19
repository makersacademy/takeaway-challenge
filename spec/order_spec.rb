require 'order'

describe Order do
  subject(:order)   { Order.new }
  let(:order_add)   { order.add('spring rolls', 2) }
  let(:wrong_add)   { order.add('ring sprolls', 2) }

  it "starts with an empty basket" do
    expect(order.basket).to eq([])
  end

  describe '#add' do
    it 'raises an error' do
      expect { wrong_add }.to raise_error("ring sprolls is not on the menu")
    end
    it 'gives items added to basket message' do
      expect(order_add).to eq('added to basket: spring rolls x2 for 3.99 each')
    end
    it "adds to basket" do
      order_add
      expect(order.basket).to eq([{ "spring rolls" => 3.99 }, { "spring rolls" => 3.99 }])
    end
  end

  describe "#check" do
    it "shows order details" do
      order_add
      expect(order.check).to eq(["spring rolls: £3.99", "spring rolls: £3.99", "Total: £7.98"])
    end
  end

  describe "#checkout" do
    it "gives confirmation message" do
      expect(order.checkout).to eq("Order placed: you will receive a text message soon")
    end
  end
end
