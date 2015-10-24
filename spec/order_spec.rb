require 'order'

describe Order do

  subject(:order) { described_class.new }

  let(:menu) { double(:menu, :dishes => { 'Spring Roll' => 0.99 }) }
  let(:itm) { 'Spring Roll' }
  let(:qty) { 2 }

  context "#initialize" do

    it "creates an empty #basket" do
      expect(order.basket).to be_empty
    end
  end

  context "#add_to_basket" do

    it "adds items to #basket" do
      order.add_to_basket(itm, qty)
      expect(order.basket[itm]).to eq 2
    end
  end

  context "#basket_sum" do

    it "reports summary of basket" do
      order.add_to_basket(itm, qty)
      message = "#{itm} x#{qty} = £#{(menu.dishes[itm]*qty).round(2)}"
      expect(order.basket_sum(menu)).to eq message
    end
  end

  context "#total_bill" do

    it "calculates total bill" do
      order.add_to_basket(itm, qty)
      expect(order.total_bill(menu)).to eq 1.98
    end
  end
end
