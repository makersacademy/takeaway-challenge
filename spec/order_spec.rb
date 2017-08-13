require_relative '../lib/order.rb'
require_relative '../lib/menu.rb'

RSpec.describe Order do
  let(:menu) { 'menu'}
  let(:dish) { "tokyo bowl"}
  let(:quant) { 2 }
  let(:price_true) { 24 }
  let(:price_false) { 23 }
  it { is_expected.to be_a Order }
  it { is_expected.to respond_to :process_order }

  context "#init" do
    it "can receive an order" do
      expect(Order).to receive(:new).with(dish, quant, price_true)
      Order.new(dish, quant, price_true)
    end
    it "stores an order" do
      order = Order.new(dish, quant, price_true)
      expect(order.basket).to eq([dish, quant, price_true])
    end
    it "contains the menu" do
      expect(subject.instance_variable_get(:@current_menu)).to be_a Hash
    end
  end

  context ".process_order" do
    it "raises error if price is wrong" do
      order = Order.new(dish, quant, price_false)
      expect { order.process_order }.to raise_error("Incorrect price entered")
    end
    it "accepts correct order" do
      order = Order.new(dish, quant, price_true)
      expect(order.process_order).to eq("Order completed, a text is on its way")
    end
    pending "sends a text with delivery time +1" do
    end
  end
end
